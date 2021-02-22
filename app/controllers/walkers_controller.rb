class WalkersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in
    
    def index
        # list of all walkers in the system
        @walkers = Walker.all
    end

    def show
        # show's the specific walker's info 
        @walker = Walker.find_by(id: params[:id])
    end

end
