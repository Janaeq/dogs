class SessionsController < ApplicationController
    def welcome # homepage
    end

    def new # log in

    end

    def create # Log in 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid Credentials. Please try again."
            redirect_to login_path
        end
    end

    def destroy # log out 
        session.delete(:user_id)
        redirect_to login_path
    end
end
