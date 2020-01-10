class EliminatorLeaguesController < ApplicationController
    def index 
        eliminator_leagues = EliminatorLeague.all  
        render json: eliminator_leagues
    end

    def show 
        eliminator_league = EliminatorLeague.find(params[:id])
        render json: eliminator_league
    end

    def create
        eliminator_league = EliminatorLeague.create(eliminator_league_params)
        render json: eliminator_league
    end

    def open_eliminator_leagues
        user = User.find(params[:user_id])
        open_leagues = EliminatorLeague.all.select do |league|
            !league.users.include?(user)
            #Second condition =>
            #Game.all.select {|game| game.completed}.length == 0
        end
        render json: open_leagues
    end

    private
    def eliminator_league_params
        params.require(:eliminator_league).permit(:id,:name, :host_id)
    end

end
