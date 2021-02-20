class WalksController < ApplicationController
    before_action :find_dog, only: [:index, :new, :create]

    def index
        if params[:dog_id] && @dog
            @walks = @dog.walks
        else
            @walks = current_user.scheduled_walks
        end
    end

    def new
        # schedules a new walk
        if params[:dog_id] && @dog
            @walk = @dog.walks.build # prepopulates the dog field of the new form
        else 
            @walk = Walk.new
            @walk.build_dog
        end
    end

    def create
        if params[:dog_id] && @dog 
            @walk = @dog.walks.build(walk_params)
        else
            @walk = current_user.scheduled_walks.build(walk_params)
        end
        if @walk.save
            redirect_to dog_walks_path(@walk.dog)
        else
            render :new
        end
    end

    def destroy
        walk = Walk.find(params[:id])
        walk.destroy
        redirect_to dogs_path
    end
    
    private

    def walk_params
        params.require(:walk).permit(:date_time, :dog_id, :walker_id, dog_attributes:[:name, :age, :breed, :gender, :user_id])
    end
    
    def find_dog
        @dog = Dog.find_by_id(params[:dog_id])
    end
end