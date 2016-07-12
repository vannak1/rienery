json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :question
  json.url discussion_url(discussion, format: :json)
end
