class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :lessons
  validates :title, presence: true
  validates :description, presence: true,
                          length: {minimum: 25}
end
