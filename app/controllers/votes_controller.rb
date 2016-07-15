class VotesController < ApplicationController
  def create
    @vote = current_user.votes.find_by(comment_id: params[:comment_id])
    if @vote.nil?
      @vote = current_user.votes.create(comment_id: params[:comment_id])
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def destroy
    @vote = current_user.votes.find_by(comment_id: params[:comment_id])
    @vote.destroy unless @vote.nil?
    redirect_to request.referrer
  end
end
