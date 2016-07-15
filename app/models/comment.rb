class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :discussion
  has_many :votes

  scope :order_by_vote, -> { joins(:votes).group(:comment_id).order("count(comment_id) desc")}
end
