json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :title, :content, :locked?, :course_id
  json.url lesson_url(lesson, format: :json)
end
