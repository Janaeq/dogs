class WalksController < ApplicationController
    before_action :find_walk, only: [:show, :destroy]
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
            dog = current_user.dogs.build(dog_params)
            @walk = current_user.scheduled_walks.build(walk_params)
            if dog.save # can't save a walk without saving the new dog first 
                @walk.dog_id = dog.id
            else
                flash[:error] = "There's something wrong with your dog. Please try again"
            end
        end
        if @walk.save
            redirect_to dog_walks_path(@walk.dog)
        else
            render :new
        end
    end

    def destroy
        # cancels walk
        @walk.destroy
        redirect_to user_path(current_user)
    end

    def walk_params
        params.require(:walk).permit(:date_time, :dog_id, :walker_id, dog_attributes:[:name, :age, :breed, :gender, :user_id])
    end

    def dog_params
        params.require(:walk).require(:dog_attributes).permit(:name, :age, :breed, :gender, :user_id)    
    end

    def find_walk
        @walk = Walk.find_by(id: params[:id])
    end
    
    def find_dog
        @dog = Dog.find_by(id: params[:dog_id])
    end
end