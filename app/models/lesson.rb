class Lesson < ActiveRecord::Base
  belongs_to :course
  
  scope :locked, -> { where(locked?: true) }

end
