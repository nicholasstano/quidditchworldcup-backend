class UsersController < ApplicationController
    def create 
        user = User.new(username: params[:username], password: params[:password])
        if user.save 
            render json: user 
        else 
            render json: {errors: user.errors.full_messages}
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def index 
        user = User.all 
        render json: user
    end
end
