class WalksController < ApplicationController

    def index
        @dog = Dog.find_by(id: params[:dog_id])
    end

    def new
        # schedules a new walk
        @walk = Walk.new
        @walk.build_dog
    end

    def create
        @walk = Walk.new(walk_params)
        if @walk.save
            redirect_to dog_path(@walk.dog)
        else
            render :new
        end
    end

    def show
        @walk = Walk.find_by(id: params[:id])
    end

    def edit
        @walk = Walk.find_by(id: params[:id])
    end

    def destroy
        # cancels walk
    end

    def walk_params
        params.require(:walk).permit(:date_time, :dog_id, :walker_id, dog_attributes:[:name, :age, :breed, :gender, :user_id])
    end
end