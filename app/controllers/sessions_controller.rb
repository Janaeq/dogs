class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in
    
    def welcome # homepage
        if logged_in?
            redirect_to user_path(current_user)
        end
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
        redirect_to root_path
    end

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to root_path
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
#  need client_id from google OAuth from google api? Double check, there is no dot env file here