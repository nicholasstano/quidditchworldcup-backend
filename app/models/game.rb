class Game < ApplicationRecord
    belongs_to :home, class_name: 'Team'
    belongs_to :away, class_name: 'Team'
    belongs_to :week
    has_many :player_games
    has_many :players, through: :player_games
    has_many :eliminator_picks
    has_many :users, through: :eliminator_picks

    def teamInfo
        player_game = self.player_games.select {|player| player.snitch_caught == 150}
        player = player_game.map {|player| player.player.name}
        snitch_caught_by = player[0]
        team = player_game.map {|player| player.player.team.name}
        team_captured_snitch = team[0]
        {
            game_id: self.id,
            snitch_caught_by: snitch_caught_by,
            team_captured_snitch: team_captured_snitch,
            week_id: week.id,
            game_completed: self.completed,
            home_name: home.name,
            home_flag: home.flag,
            home_score: home_score,
            home_id: home.id,
            away_name: away.name,
            away_flag: away.flag,   
            away_score: away_score,
            away_id: away.id,
        }
    end

    def complete_game
        home_chasers = self.home.players.select {|player| player.position == "Chaser"}.map {|p| p.player_games.where(game_id: self.id)}
        home_shots = 0
        home_scores = 0
        home_chasers.each do |chaser|
            home_player_shots = rand(1..15)
            home_player_scores = rand(home_player_shots) * 10
            home_shots = home_shots + home_player_shots
            home_scores = home_scores + home_player_scores
            chaser.update(quaffle_shots: home_player_shots)
            chaser.update(quaffle_scored: home_player_scores)
        end

        away_chasers = self.away.players.select {|player| player.position == "Chaser"}.map {|p| p.player_games.where(game_id: self.id)}
        away_shots = 0
        away_scores = 0
        away_chasers.each do |chaser|
            away_player_shots = rand(1..15)
            away_player_scores = rand(away_player_shots) * 10
            away_shots = away_shots + away_player_shots
            away_scores = away_scores + away_player_scores
            chaser.update(quaffle_shots: away_player_shots)
            chaser.update(quaffle_scored: away_player_scores)
        end
        home_keeper = self.home.players.select {|player| player.position == "Keeper"}.map {|p| p.player_games.where(game_id: self.id)}
        home_keeper.each do |keeper|
            keeper.update(quaffle_shots_against: away_shots)
            keeper.update(quaffle_saved: (away_shots * 10 - home_scores) / 10)
        end
        away_keeper = self.away.players.select {|player| player.position == "Keeper"}.map {|p| p.player_games.where(game_id: self.id)}
        away_keeper.each do |keeper|
            keeper.update(quaffle_shots_against: home_shots)
            keeper.update(quaffle_saved: (home_shots * 10 - home_scores) / 10)
        end

        beaters = self.player_games.select do |player_games|
            player_games.player.position == "Beater"
        end
        beaters.each do |beater|
            beater.update(bludger_smashed: [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].sample)
        end

        seekers = self.player_games.select do |player_games|
            player_games.player.position == "Seeker"
        end

        teams = ["home", "away"]

        snitch = teams.sample

        if (snitch == "home") 
            seekers.first.update(snitch_caught: 150)
        elsif (snitch == "away")
            seekers.last.update(snitch_caught: 150)
        end 

        homePlayers = self.home.players
        allHomePlayerGames = homePlayers.map {|player| player.player_games}.flatten
        selectedHomePlayerGames = allHomePlayerGames.select {|player_games| player_games.game_id == self.id}
        homePoints = selectedHomePlayerGames.inject(0) {|sum, player_games| sum + player_games.quaffle_scored + player_games.snitch_caught}

        awayPlayers = self.away.players
        allAwayPlayerGames = awayPlayers.map {|player| player.player_games}.flatten
        selectedAwayPlayerGames = allAwayPlayerGames.select {|player_games| player_games.game_id == self.id}
        awayPoints = selectedAwayPlayerGames.inject(0) {|sum, player_games| sum + player_games.quaffle_scored + player_games.snitch_caught}

        self.update(home_score: homePoints, away_score: awayPoints, completed: true)

        homePointsFor = self.home.points_for
        updatedHomePointsFor = [self.home_score, homePointsFor].reduce(:+)
        self.home.update(points_for: updatedHomePointsFor)
        homePointsAgainst = self.home.points_against
        updatedHomePointsAgainst = [self.away_score, homePointsAgainst].reduce(:+)
        self.home.update(points_against: updatedHomePointsAgainst)

        awayPointsFor = self.away.points_for
        updatedAwayPointsFor = [self.away_score, awayPointsFor].reduce(:+)
        self.away.update(points_for: updatedAwayPointsFor)
        awayPointsAgainst = self.away.points_against
        updatedAwayPointsAgainst = [self.home_score, awayPointsAgainst].reduce(:+)
        self.away.update(points_against: updatedAwayPointsAgainst)
        if (self.home_score == self.away_score)
            if snitch == "home" 
                homeTeamWins = self.home.wins
                updatedHomeTeamWins = [homeTeamWins, 1].reduce(:+)
                self.home.update(wins: updatedHomeTeamWins)
                awayTeamLosses = self.away.losses
                updatedAwayTeamLosses = [awayTeamLosses, 1].reduce(:+)
                self.away.update(losses: updatedAwayTeamLosses)
            elsif snitch == "away"
                awayTeamWins = self.away.wins 
                updatedAwayTeamWins = [awayTeamWins, 1].reduce(:+)
                self.away.update(wins: updatedAwayTeamWins)
                homeTeamLosses = self.home.losses
                updatedHomeTeamLosses = [homeTeamLosses, 1].reduce(:+)
                self.home.update(losses: updatedHomeTeamLosses)
            end
        elsif (self.home_score > self.away_score)
            homeTeamWins = self.home.wins
            updatedHomeTeamWins = [homeTeamWins, 1].reduce(:+)
            self.home.update(wins: updatedHomeTeamWins)
            awayTeamLosses = self.away.losses
            updatedAwayTeamLosses = [awayTeamLosses, 1].reduce(:+)
            self.away.update(losses: updatedAwayTeamLosses)
        elsif (self.home_score < self.away_score)
            awayTeamWins = self.away.wins 
            updatedAwayTeamWins = [awayTeamWins, 1].reduce(:+)
            self.away.update(wins: updatedAwayTeamWins)
            homeTeamLosses = self.home.losses
            updatedHomeTeamLosses = [homeTeamLosses, 1].reduce(:+)
            self.home.update(losses: updatedHomeTeamLosses)
        end
    end

end