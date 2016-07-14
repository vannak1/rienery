class Lesson < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true
  validates :content, presence: true,
                      length: {minimum: 20}
end
