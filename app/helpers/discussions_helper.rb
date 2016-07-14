module DiscussionsHelper
  def join_tags(discussion)
    discussion.tags.map { |t| t.name }.join(", ")
  end
end
