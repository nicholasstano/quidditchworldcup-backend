class PlayerPlayoffGamesController < ApplicationController
    def index
        player_playoff_games = PlayerPlayoffGame.all 
        render json: player_playoff_games
    end

    
end
