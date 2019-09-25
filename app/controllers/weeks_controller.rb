class WeeksController < ApplicationController
    def index 
        weeks = Week.all  
        render json: weeks
    end

    def show
        week = Week.find(params[:id])
        render json: week   
    end

    def update
        week = Week.all.find(params[:id])
        completedWeek = week.games.select {|game| game.completed == false}
        if (completedWeek.length == 0)
            week.update(games_completed: true)
        end
        render json: week
    end
end
