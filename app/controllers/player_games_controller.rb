class PlayerGamesController < ApplicationController
    def index 
        player_games = PlayerGame.all 
        render json: player_games
    end
end
