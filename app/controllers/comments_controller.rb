class CommentsController < ApplicationController
    
    def index 
        @walker = Walker.find_by(id: params[:walker_id])
    end

    def new
        # creates a new comment about a specific walker
        @walker = Walker.find_by(id: params[:walker_id])
        @comment = Comment.new
    end

    def create
        # creates a new comment about a specific walker
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to walker_comments_path(params[:comment][:walker_id])
        else 
            render :new
        end
    end

    def edit
        # edits a comment that the logged in user has made 
    end

    def destroy
        # deletes a comment that the logged in user has made
    end

    private

    def comment_params
        params.require(:comment).permit(:entry, :walker_id, :user_id)
    end
end
