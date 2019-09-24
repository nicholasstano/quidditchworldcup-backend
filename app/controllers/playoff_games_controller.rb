class PlayoffGamesController < ApplicationController
    def index
        playoff_games = PlayoffGame.all 
        render json: playoff_games
    end

    def sixteen
        if (Week.all[13].games_completed == true)
        bestRecord = Team.all.sort_by {|team| [team.wins, team.points_for]}.reverse[0, 16]
        render json: bestRecord
        elsif 
        bestRecord = []
        render json: bestRecord
        end
    end

    def roundOneGames
        roundOneGamesArray = []
        topSixteen = Team.all.sort_by {|team| [team.wins, team.points_for]}.reverse[0, 16]
        gameOne = PlayoffGame.create(week_id: Week.all[14].id, home_id: topSixteen[0].id, away_id: topSixteen[15].id, home_score: 0, away_score: 0, completed: false)
            gameOne.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameOne.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
        roundOneGamesArray.push(gameOne)
        gameTwo = PlayoffGame.create(week_id: Week.all[14].id, home_id: topSixteen[1].id, away_id: topSixteen[14].id, home_score: 0, away_score: 0, completed: false)
            gameTwo.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameTwo.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
        roundOneGamesArray.push(gameTwo)
        gameThree = PlayoffGame.create(week_id: Week.all[14].id, home_id: topSixteen[2].id, away_id: topSixteen[13].id, home_score: 0, away_score: 0, completed: false)
            gameThree.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameThree.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
        roundOneGamesArray.push(gameThree)
        gameFour = PlayoffGame.create(week_id: Week.all[14].id, home_id: topSixteen[3].id, away_id: topSixteen[12].id, home_score: 0, away_score: 0, completed: false)
            gameFour.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameFour.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundOneGamesArray.push(gameFour)
        gameFive = PlayoffGame.create(week_id: Week.all[14].id, home_id: topSixteen[4].id, away_id: topSixteen[11].id, home_score: 0, away_score: 0, completed: false)
            gameFive.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameFive.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundOneGamesArray.push(gameFive)
        gameSix = PlayoffGame.create(week_id: Week.all[14].id, home_id: topSixteen[5].id, away_id: topSixteen[10].id, home_score: 0, away_score: 0, completed: false)
            gameSix.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameSix.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundOneGamesArray.push(gameSix)
        gameSeven = PlayoffGame.create(week_id: Week.all[14].id, home_id: topSixteen[6].id, away_id: topSixteen[9].id, home_score: 0, away_score: 0, completed: false)
            gameSeven.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameSeven.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundOneGamesArray.push(gameSeven)
        gameEight = PlayoffGame.create(week_id: Week.all[14].id, home_id: topSixteen[7].id, away_id: topSixteen[8].id, home_score: 0, away_score: 0, completed: false)
            gameEight.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameEight.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundOneGamesArray.push(gameEight)
        Week.all[14].update(games_completed: false)
        render json: roundOneGamesArray
    end

end
