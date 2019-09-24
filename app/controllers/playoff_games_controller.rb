class PlayoffGamesController < ApplicationController
    def index
        playoff_games = PlayoffGame.all 
        render json: playoff_games
    end

    def sixteen
        if (Week.all[13].games_completed == true)
        bestRecord = Team.all.sort_by {|team| [team.wins, team.points_for]}.reverse[0, 16]
        render json: bestRecord
        elsif 
        bestRecord = []
        render json: bestRecord
        end
    end
end
