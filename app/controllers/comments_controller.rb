class CommentsController < ApplicationController
  def create
   @discussion = Discussion.find(params[:discussion_id])
   @comment = @discussion.comments.create(comment_params)
   redirect_to request.referrer
  end

  def destroy
   @discussion = Discussion.find(params[:discussion_id])
   @comment = @discussion.comments.find(params[:id])
   @comment.destroy
   redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commenter)
  end
end
