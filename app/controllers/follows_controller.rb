class FollowsController < ApplicationController
  include Secured

  before_action :logged_in?

  def create
    user = User.find(params[:user_id])
    followed_relationship = user.followed_relationships.build(
      follower_id: current_user.id
    )
    if followed_relationship.save
      redirect_to users_path
    else
      redirect_to users_path, alert: "Can't follow that user"
    end
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy
    redirect_to users_path, notice: "You are not following #{follow.following.email} anymore"
  end
end
