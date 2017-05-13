module Secured
  extend ActiveSupport::Concern

  def can_create_events?
    redirect_to(root_path, notice: "Not authorized to create events") unless current_user.role != 1
  end

  def logged_in?
    redirect_to(root_path, notice: "Not authorized!") unless current_user
  end

end
