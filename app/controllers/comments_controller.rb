class CommentsController < ApplicationController
  before_action :set_discussion, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @discussion.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to discussion_path(@discussion)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to discussion_path(@discussion)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to discussion_path(@discussion)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    def set_comment
      @comment = @discussion.comments.find(params[:id])
    end
end
