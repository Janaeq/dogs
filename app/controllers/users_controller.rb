class UsersController < ApplicationController
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
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end
end
