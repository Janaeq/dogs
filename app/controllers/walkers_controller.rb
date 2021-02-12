class WalkersController < ApplicationController
    
    def index
        # list of all walkers in the system
        @walkers = Walker.all
    end

    def show
        # show's the specific walker's info 
        @walker = Walker.find_by(id: params[:id])
    end

end
