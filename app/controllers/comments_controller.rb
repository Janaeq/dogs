class CommentsController < ApplicationController
    before_action :set_walker, only: [:index, :new]

    def index 
    end

    def new
        # creates a new comment about a specific walker
        if params[:walker_id] && @walker = Walker.find_by_id(params[:walker_id])
            @comment = @walker.comments.build
        else
            @comment = Comment.new
        end
        
    end

    def create
        # creates a new comment about a specific walker
        @walker = Walker.find_by(id: params[:walker_id])
        # .build method creates a comment on the walker found above
        @comment = @walker.comments.build(comment_params)
        if @comment.save
            redirect_to walker_comments_path(@comment.walker_id)
        else 
            @walker = Walker.find_by_id(params[:walker_id]) if params[:walker_id]
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
        # finds walker to allow .build in create method
        @walker = Walker.find_by(id: params[:walker_id])
    end
end
