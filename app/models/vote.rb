class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  def up_vote
    self.comment.increment(:vote_count, by = 1)
  end
end
