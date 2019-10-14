class PlayoffGamesController < ApplicationController
    def index
        playoff_games = PlayoffGame.all 
        render json: playoff_games
    end

    def show
        playoff_game = PlayoffGame.find(params[:id])
        render json: playoff_game   
    end

    def winner 
        if PlayoffWeek.all[3].playoff_games.select {|game| game.completed == false}.length == 0
        winner = []
            PlayoffWeek.all[3].playoff_games.each do |game|
                if (game.away_score > game.home_score)
                    winner.push(game.away)
                elsif (game.home_score > game.away_score)
                    winner.push(game.home)
                elsif (game.home_score == game.away_score)
                    penalty = ["home", "away"]
                    if penalty.sample == "home"
                        new_score = game.home_score + 10
                        game.update(home_score: new_score)
                        winner.push(game.home)
                    elsif penalty.sample == "away"
                        new_score = game.away_score + 10
                        game.update(away_score: new_score)
                        winner.push(game.away)
                    end
                end
            end
        end
        render json: winner
    end

    def roundFourGames
        if PlayoffWeek.all[2].playoff_games.select {|game| game.completed == true}.length == 2 && PlayoffWeek.all[3].playoff_games.length == 0
        roundFourGamesArray = []
        winnersFromRoundThree = []
            PlayoffWeek.all[2].playoff_games.each do |game|
                if (game.away_score > game.home_score)
                    winnersFromRoundThree.push(game.away)
                elsif (game.home_score > game.away_score)
                    winnersFromRoundThree.push(game.home)
                elsif (game.home_score == game.away_score)
                    penalty = ["home", "away"]
                    if penalty.sample == "home"
                        new_score = game.home_score + 10
                        game.update(home_score: new_score)
                        winnersFromRoundThree.push(game.home)
                    elsif penalty.sample == "away"
                        new_score = game.away_score + 10
                        game.update(away_score: new_score)
                        winnersFromRoundThree.push(game.away)
                    end
                end
            end
            topTwo = winnersFromRoundThree.sort {|a, b| [b.wins, b.points_for, a.points_against] <=> [a.wins, a.points_for, b.points_against]}[0, 2]
            gameOne = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[3].id, home_id: topTwo[0].id, away_id: topTwo[1].id, home_score: 0, away_score: 0, completed: false)
            gameOne.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameOne.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundFourGamesArray.push(gameOne)
            render json: roundFourGamesArray
        else 
            if PlayoffWeek.all[2].playoff_games.select {|game| game.completed == false}.length == 0
                roundFourGamesArray = PlayoffGame.all.select {|game| game.playoff_week_id == PlayoffWeek.all[3].id}
                render json: roundFourGamesArray
            else
                render json: []
            end
        end
    end

    def roundThreeGames
        if PlayoffWeek.all[1].playoff_games.select {|game| game.completed == true}.length == 4 && PlayoffWeek.all[2].playoff_games.length == 0
            roundThreeGamesArray = []
            winnersFromRoundTwo = []
            PlayoffWeek.all[1].playoff_games.each do |game|
                if (game.away_score > game.home_score)
                    winnersFromRoundTwo.push(game.away)
                elsif (game.home_score > game.away_score)
                    winnersFromRoundTwo.push(game.home)
                elsif (game.home_score == game.away_score)
                    penalty = ["home", "away"]
                    if penalty.sample == "home"
                        new_score = game.home_score + 10
                        game.update(home_score: new_score)
                        winnersFromRoundTwo.push(game.home)
                    elsif penalty.sample == "away"
                        new_score = game.away_score + 10
                        game.update(away_score: new_score)
                        winnersFromRoundTwo.push(game.away)
                    end
                end
            end
            topFour = winnersFromRoundTwo.sort {|a, b| [b.wins, b.points_for, a.points_against] <=> [a.wins, a.points_for, b.points_against]}[0, 4]
            gameOne = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[2].id, home_id: topFour[0].id, away_id: topFour[3].id, home_score: 0, away_score: 0, completed: false)
                gameOne.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameOne.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
            roundThreeGamesArray.push(gameOne)
            gameTwo = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[2].id, home_id: topFour[1].id, away_id: topFour[2].id, home_score: 0, away_score: 0, completed: false)
            gameTwo.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameTwo.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameTwo.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameTwo.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundThreeGamesArray.push(gameTwo)
            render json: roundThreeGamesArray
        else
            if PlayoffWeek.all[1].playoff_games.select {|game| game.completed == false}.length == 0
                roundThreeGamesArray = PlayoffGame.all.select {|game| game.playoff_week_id == PlayoffWeek.all[2].id}
                render json: roundThreeGamesArray
            else
                render json: []
            end   
        end
    end

    def roundTwoGames
        if PlayoffWeek.all[0].playoff_games.select {|game| game.completed == true}.length == 8 && PlayoffWeek.all[1].playoff_games.length == 0
            roundTwoGamesArray = []
            winnersFromRoundOne = []
            PlayoffWeek.all[0].playoff_games.each do |game|
                if (game.away_score > game.home_score)
                    winnersFromRoundOne.push(game.away)
                elsif (game.home_score > game.away_score)
                    winnersFromRoundOne.push(game.home)
                elsif (game.home_score == game.away_score)
                    penalty = ["home", "away"]
                    if penalty.sample == "home"
                        new_score = game.home_score + 10
                        game.update(home_score: new_score)
                        winnersFromRoundOne.push(game.home)
                    elsif penalty.sample == "away"
                        new_score = game.away_score + 10
                        game.update(away_score: new_score)
                        winnersFromRoundOne.push(game.away)
                    end
                end
            end
            topEight = winnersFromRoundOne.sort {|a, b| [b.wins, b.points_for, a.points_against] <=> [a.wins, a.points_for, b.points_against]}[0, 8]
            gameOne = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[1].id, home_id: topEight[0].id, away_id: topEight[7].id, home_score: 0, away_score: 0, completed: false)
                gameOne.home.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
                gameOne.away.players.each do |player|
                    PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameOne.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
                end
            roundTwoGamesArray.push(gameOne)
            gameTwo = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[1].id, home_id: topEight[1].id, away_id: topEight[6].id, home_score: 0, away_score: 0, completed: false)
            gameTwo.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameTwo.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameTwo.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameTwo.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundTwoGamesArray.push(gameTwo)
            gameThree = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[1].id, home_id: topEight[2].id, away_id: topEight[5].id, home_score: 0, away_score: 0, completed: false)
            gameThree.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameThree.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameThree.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameThree.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            roundTwoGamesArray.push(gameThree)
            gameFour = PlayoffGame.create(playoff_week_id: PlayoffWeek.all[1].id, home_id: topEight[3].id, away_id: topEight[4].id, home_score: 0, away_score: 0, completed: false)
            gameFour.home.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameFour.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
            gameFour.away.players.each do |player|
                PlayerPlayoffGame.create(player_id: player.id, playoff_game_id: gameFour.id, quaffle_scored: 0, quaffle_saved: 0, bludger_smashed: 0, snitch_caught: 0)
            end
                roundTwoGamesArray.push(gameFour)
                render json: roundTwoGamesArray
        else  
            if PlayoffWeek.all[0].playoff_games.select {|game| game.completed == false}.length == 0
                roundTwoGamesArray = PlayoffGame.all.select {|game| game.playoff_week_id == PlayoffWeek.all[1].id}
                render json: roundTwoGamesArray
            else
                render json: []
            end
        end
    end

    def roundOneGames
        if Game.all.select{|game| game.completed == false}.length == 0 && PlayoffWeek.first.playoff_games.length == 0
            roundOneGamesArray = []
            topSixteen = Team.all.sort {|a, b| [b.wins, b.points_for, a.points_against] <=> [a.wins, a.points_for, b.points_against]}[0, 16]            
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