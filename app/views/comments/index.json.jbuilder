json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :user_id, :discussion_id
  json.url comment_url(comment, format: :json)
end
