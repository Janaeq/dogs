class WalksController < ApplicationController

    def new
        # schedules a new walk
        @walk = Walk.new
    end

    def create
        # schedules a new walk
        @walk = Walk.new(walk_params)
    end

    def edit
        # edits details of a scheduled walk
        @walk = Walk.find_by(id: params[:id])
    end

    def destroy
        # cancels walk
    end

    def walk_params
        params.require(:walk).permit(:date_time)
    end
end
