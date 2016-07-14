class DiscussionPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @record = model
  end

  def create?
    @current_user.admin? or @record.user == @current_user
  end

  def update?
    @current_user.admin? or @record.user == @current_user
  end
end
