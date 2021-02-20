class CommentsController < ApplicationController
    before_action :set_walker, only: [:index, :new]

    def index 
    end

    def new
        # creates a new comment about a specific walker
        @comment = Comment.new
    end

    def create
        # creates a new comment about a specific walker
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to walker_comments_path(@comment.walker_id)
        else 
            render :new
        end
    end

    def destroy
        # deletes a comment that the logged in user has made
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to walker_comments_path (comment.walker_id)
    end

    private

    def comment_params
        params.require(:comment).permit(:entry, :walker_id, :user_id)
    end

    def set_walker
        @walker = Walker.find_by(id: params[:walker_id])
    end
end
