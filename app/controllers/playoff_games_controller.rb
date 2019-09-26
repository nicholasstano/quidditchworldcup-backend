class PlayoffGamesController < ApplicationController
    def index
        playoff_games = PlayoffGame.all 
        render json: playoff_games
    end

    def show
        playoff_game = PlayoffGame.find(params[:id])
        render json: playoff_game   
    end

    def roundOneGames
        if Week.last.games.select{|game| game.completed == false}.length == 0 && PlayoffWeek.first.playoff_games.length == 0
            roundOneGamesArray = []
            topSixteen = Team.all.sort_by {|team| [team.wins, team.points_for]}.reverse[0, 16]
            gameOne = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[0].id, home_id: topSixteen[0].id, away_id: topSixteen[15].id, home_score: 0, away_score: 0, completed: false)
                gameOne.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameOne.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
            roundOneGamesArray.push(gameOne)
            gameTwo = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[0].id, home_id: topSixteen[1].id, away_id: topSixteen[14].id, home_score: 0, away_score: 0, completed: false)
                gameTwo.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameTwo.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameTwo.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameTwo.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
            roundOneGamesArray.push(gameTwo)
            gameThree = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[0].id, home_id: topSixteen[2].id, away_id: topSixteen[13].id, home_score: 0, away_score: 0, completed: false)
                gameThree.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameThree.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameThree.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameThree.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
            roundOneGamesArray.push(gameThree)
            gameFour = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[0].id, home_id: topSixteen[3].id, away_id: topSixteen[12].id, home_score: 0, away_score: 0, completed: false)
                gameFour.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameFour.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameFour.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameFour.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                roundOneGamesArray.push(gameFour)
            gameFive = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[0].id, home_id: topSixteen[4].id, away_id: topSixteen[11].id, home_score: 0, away_score: 0, completed: false)
                gameFive.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameFive.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameFive.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameFive.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                roundOneGamesArray.push(gameFive)
            gameSix = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[0].id, home_id: topSixteen[5].id, away_id: topSixteen[10].id, home_score: 0, away_score: 0, completed: false)
                gameSix.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameSix.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameSix.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameSix.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                roundOneGamesArray.push(gameSix)
            gameSeven = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[0].id, home_id: topSixteen[6].id, away_id: topSixteen[9].id, home_score: 0, away_score: 0, completed: false)
                gameSeven.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameSeven.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameSeven.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameSeven.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                roundOneGamesArray.push(gameSeven)
            gameEight = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[0].id, home_id: topSixteen[7].id, away_id: topSixteen[8].id, home_score: 0, away_score: 0, completed: false)
                gameEight.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameEight.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameEight.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameEight.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                roundOneGamesArray.push(gameEight)
            render json: roundOneGamesArray
        else  
            round_one_playoff_games = PlayoffGame.all.select {|game| game.playoff_week_id == PlayoffWeek.first.id}
            render json: round_one_playoff_games
        end
    end

    def update
        playoff_game = PlayoffGame.find(params[:id])
        chasers = playoff_game.player_playoff_games.select do |player_games|
            player_games.player.position == "Chaser"
        end
        chasers.each do |chaser|
            chaser.update(quaffle_scored: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100].sample)
        end  
        beaters = playoff_game.player_playoff_games.select do |player_games|
            player_games.player.position == "Beater"
        end
        beaters.each do |beater|
            beater.update(bludger_smashed: [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].sample)
        end

        keepers = playoff_game.player_playoff_games.select do |player_games|
            player_games.player.position == "Keeper"
        end
        
        keepers.each do |keeper|
            keeper.update(quaffle_saved: [1, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].sample)
        end

        seekers = playoff_game.player_playoff_games.select do |player_games|
            player_games.player.position == "Seeker"
        end

        teams = ["home", "away"]

        snitch = teams.sample

        if (snitch == "home") 
            seekers.first.update(snitch_caught: 150)
        elsif (snitch == "away")
            seekers.last.update(snitch_caught: 150)
        end 

        homePlayers = playoff_game.home.players
        allHomePlayerGames = homePlayers.map {|player| player.player_playoff_games}.flatten
        selectedHomePlayerGames = allHomePlayerGames.select {|player_games| player_games.playoff_game_id == playoff_game.id}
        homePoints = selectedHomePlayerGames.inject(0) {|sum, player_games| sum + player_games.quaffle_scored + player_games.snitch_caught}

        awayPlayers = playoff_game.away.players
        allAwayPlayerGames = awayPlayers.map {|player| player.player_playoff_games}.flatten
        selectedAwayPlayerGames = allAwayPlayerGames.select {|player_games| player_games.playoff_game_id == playoff_game.id}
        awayPoints = selectedAwayPlayerGames.inject(0) {|sum, player_games| sum + player_games.quaffle_scored + player_games.snitch_caught}

        playoff_game.update(home_score: homePoints, away_score: awayPoints, completed: true)

        render json: playoff_game
    end
end
        # homePointsFor = playoff_game.home.points_for
        # updatedHomePointsFor = [playoff_game.home_score, homePointsFor].reduce(:+)
        # game.home.update(points_for: updatedHomePointsFor)
        # homePointsAgainst = playoff_game.home.points_against
        # updatedHomePointsAgainst = [playoff_game.away_score, homePointsAgainst].reduce(:+)
        # game.home.update(points_against: updatedHomePointsAgainst)

        # awayPointsFor = game.away.points_for
        # updatedAwayPointsFor = [game.away_score, awayPointsFor].reduce(:+)
        # game.away.update(points_for: updatedAwayPointsFor)
        # awayPointsAgainst = game.away.points_against
        # updatedAwayPointsAgainst = [game.home_score, awayPointsAgainst].reduce(:+)
        # game.away.update(points_against: updatedAwayPointsAgainst)

        # if (game.home_score == game.away_score)
        #     if snitch == "home" 
        #         homeTeamWins = game.home.wins
        #         updatedHomeTeamWins = [homeTeamWins, 1].reduce(:+)
        #         game.home.update(wins: updatedHomeTeamWins)
        #         awayTeamLosses = game.away.losses
        #         updatedAwayTeamLosses = [awayTeamLosses, 1].reduce(:+)
        #         game.away.update(losses: updatedAwayTeamLosses)
        #     elsif snitch == "away"
        #         awayTeamWins = game.away.wins 
        #         updatedAwayTeamWins = [awayTeamWins, 1].reduce(:+)
        #         game.away.update(wins: updatedAwayTeamWins)
        #         homeTeamLosses = game.home.losses
        #         updatedHomeTeamLosses = [homeTeamLosses, 1].reduce(:+)
        #         game.home.update(losses: updatedHomeTeamLosses)
        #     end
        # elsif (game.home_score > game.away_score)
        #     homeTeamWins = game.home.wins
        #     updatedHomeTeamWins = [homeTeamWins, 1].reduce(:+)
        #     game.home.update(wins: updatedHomeTeamWins)
        #     awayTeamLosses = game.away.losses
        #     updatedAwayTeamLosses = [awayTeamLosses, 1].reduce(:+)
        #     game.away.update(losses: updatedAwayTeamLosses)
        # elsif (game.home_score < game.away_score)
        #     awayTeamWins = game.away.wins 
        #     updatedAwayTeamWins = [awayTeamWins, 1].reduce(:+)
        #     game.away.update(wins: updatedAwayTeamWins)
        #     homeTeamLosses = game.home.losses
        #     updatedHomeTeamLosses = [homeTeamLosses, 1].reduce(:+)
        #     game.home.update(losses: updatedHomeTeamLosses)
        # end