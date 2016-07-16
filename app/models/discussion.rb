class Discussion < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, through: :comments
  belongs_to :user

  validates_presence_of :title, :content
  validates :title, length: {minimum: 5}
  validates :content, length: {minimum: 5}
end
