class DogsController < ApplicationController
    def index
        # @dogs = array of all dogs that belong to logged in user
        user = User.find_by(id: session[:user_id])
        @dogs = user.dogs
    end
    
    def new
        @dog = Dog.new
    end

    def create
        # create a new dog for the logged in user
        @dog = Dog.new(dog_params)
        # set the user_id to the user_id in the session
        @dog.user_id = session[:user_id]
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
    end

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :gender)
    end
end
