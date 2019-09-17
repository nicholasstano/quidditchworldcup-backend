class WeeksController < ApplicationController
    def index 
        weeks = Week.all  
        render json: weeks
    end
end
