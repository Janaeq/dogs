class UsersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

    def new # sign up
        @user = User.new
    end

    def create # sign up
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show # profile page
        @user = User.find_by(id: params[:id])
        if current_user != @user
            redirect_to user_path(current_user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end
end
