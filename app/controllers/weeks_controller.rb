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
    end

    def top_sixteen 
        if (Week.all[13].games_completed == true)
        bestRecord = Team.all.sort_by {|team| [team.wins, team.points_for]}.reverse[0, 16]
        render json: bestRecord
        end
    end
end
