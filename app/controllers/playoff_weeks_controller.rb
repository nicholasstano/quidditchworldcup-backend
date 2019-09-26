class PlayoffWeeksController < ApplicationController
    def index
        playoff_weeks = PlayoffWeek.all 
        render json: playoff_weeks
    end
end
