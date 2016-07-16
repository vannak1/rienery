class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :lessons, dependent: :destroy

  validates_presence_of :title, :description
  validates :title, length: {minimum: 5}
  validates :description, length: {minimum: 5}
  
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
