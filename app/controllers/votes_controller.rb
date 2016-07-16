class VotesController < ApplicationController
  def create
    @vote = current_user.votes.find_by(comment_id: params[:comment_id])
    if @vote.nil?
      @vote = current_user.votes.create(comment_id: params[:comment_id]).up_vote
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end
end
