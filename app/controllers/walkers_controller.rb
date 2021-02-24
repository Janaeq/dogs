class WalkersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in
    
    def index
        # list of all walkers in the system
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @walkers = @user.walkers
        else
            @walkers = Walker.all
        end
    end

    def show
        # show's the specific walker's info 
        @walker = Walker.find_by(id: params[:id])
    end

end
