class CommentsController < ApplicationController
    
    def new
        # creates a new comment about a specific walker
        @comment = Comment.new
    end

    def create
        # creates a new comment about a specific walker
        
    end

    def edit
        # edits a comment that the logged in user has made 
    end

    def destroy
        # deletes a comment that the logged in user has made
    end

end
