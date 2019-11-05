class EliminatorLeaguesController < ApplicationController
    def index 
        eliminator_leagues = EliminatorLeague.all  
        render json: eliminator_leagues
    end

    def show 
        eliminator_league = EliminatorLeague.find(params[:id])
        render json: eliminator_league
    end
end
