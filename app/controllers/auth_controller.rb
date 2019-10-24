class AuthController < ApplicationController
    def login 
        user = User.find_by(username: params[:username])
        if (user && user.authenticate(params[:password]))
            render json: user
        else 
            render json: {errors: "invalid username/password combination"}
        end
    end

    def autologin
        user_id = request.headers['Authorization']
        if user_id
            user = User.find(user_id)
            render json: user
        else 
            render json: {errors: "invalid username/password combination"}
        end
    end
end