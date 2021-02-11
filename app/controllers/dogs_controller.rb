class DogsController < ApplicationController
    def index
        # @dogs = array of all dogs that belong to logged in user
    end
    
    def new
        # would we need @user here to specify a hidden type for user_id in this form?
        # create a new dog for the logged in user
    end

    def create
        # create a new dog for the logged in user
    end

    def show
        # show the dog's profile. can only be visible by the dogs owner
    end 

    def destroy
        # deletes the instance of the dog. can only be done if dog belongs to logged in user
    end
end
