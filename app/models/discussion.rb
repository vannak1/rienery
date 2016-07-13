class Discussion < ActiveRecord::Base
  has_many :comments
  has_many :votes, through: :comments
  belongs_to :user
end
