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
        game.complete_game
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




