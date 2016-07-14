class Discussion < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, through: :comments
  has_many :tags
  belongs_to :user

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  validates :question, presence: true,
                       length: {minimum: 10}
end
