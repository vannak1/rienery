class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  def up_vote
    self.comment.vote_count += 1
  end

  def down_vote
    self.comment.vote_count -= 1
  end
end
