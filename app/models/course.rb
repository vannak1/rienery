class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :lessons
  
  def lesson
    Lesson.new
  end

  def lesson_attributes=(attributes)
    existing_lesson = self.lessons.find_by(title: attributes["title"])
    if existing_lesson.nil?
      self.lessons.build(attributes)
    end
    existing_lesson
  end
end
