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
        byebug
    end

    private 

    def game_params 
        params.permit(:id)
    end 

end

# # chasers = Game.first.player_games.select do |player_games| 
# #     player_games.player.position == "Chaser"
# # end
# # chasers.each do |chaser|
#     chaser.update(quaffle_scored: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100].sample)
# end

# beaters = Game.first.player_games.select do |player_games|
#     player_games.player.position == "Beater"
# end
# beaters.each do |beater|
#     beater.update(bludger_smashed: [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].sample)
# end

# keepers = Game.first.player_games.select do |player_games|
#     player_games.player.position == "Keeper"
# end
# keepers.each do |keeper|
#     keeper.update(quaffle_saved: [1, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].sample)
# end
# seekers = Game.first.player_games.select do |player_games|
#     player_games.player.position == "Seeker"
# end
# teams = ["home", "away"]

# snitch = teams.sample
# if (snitch == "home") 
#     seekers.first.update(snitch_caught: 150)
# elsif (snitch == "away")
#     seekers.last.update(snitch_caught: 150)
# end 
homePlayers = Game.first.home.players
allHomePlayerGames = homePlayers.map {|player| player.player_games}.flatten
selectedHomePlayerGames = allHomePlayerGames.select {|player_games| player_games.game_id == Game.first.id}
homePoints = selectedHomePlayerGames.inject(0) {|sum, player_games| sum + player_games.quaffle_scored + player_games.snitch_caught}

awayPlayers = Game.first.away.players
allAwayPlayerGames = awayPlayers.map {|player| player.player_games}.flatten
selectedAwayPlayerGames = allAwayPlayerGames.select {|player_games| player_games.game_id == Game.first.id}
awayPoints = selectedAwayPlayerGames.inject(0) {|sum, player_games| sum + player_games.quaffle_scored + player_games.snitch_caught}

Game.first.update(home_score: homePoints, away_score: awayPoints, completed: true)