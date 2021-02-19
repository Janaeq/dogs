class DogsController < ApplicationController
    def index
        # @dogs = array of all dogs that belong to logged in user
        @dogs = current_user.dogs
    end
    
    def new
        @dog = Dog.new
    end

    def create # create a new dog for the logged in user
        # .build method automatically puts the user_id of the new dog = to current_user id
        @dog = current_user.dogs.build(dog_params)
        if @dog.save
            redirect_to dog_path(@dog)
        else
            render :new
        end
    end

    def show
        # show the dog's profile. can only be visible by the dogs owner
        @dog = Dog.find_by(id: params[:id])
    end 

    def destroy
        # deletes the instance of the dog. can only be done if dog belongs to logged in user
        dog = Dog.find(params[:id])
        dog.destroy
        redirect_to dogs_path
    end

    private 
    
    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :gender)
    end
end
