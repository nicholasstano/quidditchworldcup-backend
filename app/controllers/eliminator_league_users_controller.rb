class EliminatorLeagueUsersController < ApplicationController
    def index 
        eliminator_league_users = EliminatorLeagueUser.all  
        render json: eliminator_league_users
    end
    def show 
        eliminator_league_user = EliminatorLeagueUser.find(params[:id])
        render json: eliminator_league_user
    end
end
