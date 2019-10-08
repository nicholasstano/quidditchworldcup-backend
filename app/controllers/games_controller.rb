class GamesController < ApplicationController
    def index 
        games = Game.all  
        render json: games
    end

    def show
        game = Game.find(params[:id])
        render json: game    
    end

    def update
        game = Game.find(params[:id])
        chasers = game.player_games.select do |player_games| 
            player_games.player.position == "Chaser"
        end
        chasers.each do |chaser|
            chaser.update(quaffle_scored: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100].sample)
        end

        beaters = game.player_games.select do |player_games|
            player_games.player.position == "Beater"
        end
        beaters.each do |beater|
            beater.update(bludger_smashed: [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].sample)
        end

        keepers = game.player_games.select do |player_games|
            player_games.player.position == "Keeper"
        end
        
        keepers.each do |keeper|
            keeper.update(quaffle_saved: [1, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].sample)
        end

        seekers = game.player_games.select do |player_games|
            player_games.player.position == "Seeker"
        end

        teams = ["home", "away"]

        snitch = teams.sample

        if (snitch == "home") 
            seekers.first.update(snitch_caught: 150)
        elsif (snitch == "away")
            seekers.last.update(snitch_caught: 150)
        end 

        homePlayers = game.home.players
        allHomePlayerGames = homePlayers.map {|player| player.player_games}.flatten
        selectedHomePlayerGames = allHomePlayerGames.select {|player_games| player_games.game_id == game.id}
        homePoints = selectedHomePlayerGames.inject(0) {|sum, player_games| sum + player_games.quaffle_scored + player_games.snitch_caught}

        awayPlayers = game.away.players
        allAwayPlayerGames = awayPlayers.map {|player| player.player_games}.flatten
        selectedAwayPlayerGames = allAwayPlayerGames.select {|player_games| player_games.game_id == game.id}
        awayPoints = selectedAwayPlayerGames.inject(0) {|sum, player_games| sum + player_games.quaffle_scored + player_games.snitch_caught}

        game.update(home_score: homePoints, away_score: awayPoints, completed: true)

        homePointsFor = game.home.points_for
        updatedHomePointsFor = [game.home_score, homePointsFor].reduce(:+)
        game.home.update(points_for: updatedHomePointsFor)
        homePointsAgainst = game.home.points_against
        updatedHomePointsAgainst = [game.away_score, homePointsAgainst].reduce(:+)
        game.home.update(points_against: updatedHomePointsAgainst)

        awayPointsFor = game.away.points_for
        updatedAwayPointsFor = [game.away_score, awayPointsFor].reduce(:+)
        game.away.update(points_for: updatedAwayPointsFor)
        awayPointsAgainst = game.away.points_against
        updatedAwayPointsAgainst = [game.home_score, awayPointsAgainst].reduce(:+)
        game.away.update(points_against: updatedAwayPointsAgainst)
        if (game.home_score == game.away_score)
            if snitch == "home" 
                homeTeamWins = game.home.wins
                updatedHomeTeamWins = [homeTeamWins, 1].reduce(:+)
                game.home.update(wins: updatedHomeTeamWins)
                awayTeamLosses = game.away.losses
                updatedAwayTeamLosses = [awayTeamLosses, 1].reduce(:+)
                game.away.update(losses: updatedAwayTeamLosses)
            elsif snitch == "away"
                awayTeamWins = game.away.wins 
                updatedAwayTeamWins = [awayTeamWins, 1].reduce(:+)
                game.away.update(wins: updatedAwayTeamWins)
                homeTeamLosses = game.home.losses
                updatedHomeTeamLosses = [homeTeamLosses, 1].reduce(:+)
                game.home.update(losses: updatedHomeTeamLosses)
            end
        elsif (game.home_score > game.away_score)
            homeTeamWins = game.home.wins
            updatedHomeTeamWins = [homeTeamWins, 1].reduce(:+)
            game.home.update(wins: updatedHomeTeamWins)
            awayTeamLosses = game.away.losses
            updatedAwayTeamLosses = [awayTeamLosses, 1].reduce(:+)
            game.away.update(losses: updatedAwayTeamLosses)
        elsif (game.home_score < game.away_score)
            awayTeamWins = game.away.wins 
            updatedAwayTeamWins = [awayTeamWins, 1].reduce(:+)
            game.away.update(wins: updatedAwayTeamWins)
            homeTeamLosses = game.home.losses
            updatedHomeTeamLosses = [homeTeamLosses, 1].reduce(:+)
            game.home.update(losses: updatedHomeTeamLosses)
        end
        selected_week = game.week 
        if selected_week.games.select {|game| game.completed == false}.length == 0 
            selected_week.update(games_completed: true)
        end
        render json:  {game: game.teamInfo}
    end

    private 

    def game_params 
        params.permit(:id)
    end 

end




