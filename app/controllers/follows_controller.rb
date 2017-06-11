class FollowsController < ApplicationController
  include Secured

  before_action :logged_in?

  def create
    user = User.find(params[:user_id])
    followed_relationship = user.followed_relationships.build(
      follower_id: current_user.id
    )
    if followed_relationship.save
      respond_to do |format|
        format.html {redirect_to users_path}
        format.json do
          render json: {followed_id: user.id, follower_id: current_user.id, follow_id: followed_relationship.id}
        end
      end
    else
      redirect_to users_path, alert: "Can't follow that user"
    end
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: "You are not following #{follow.followed.email} anymore" }
      format.json do
        render json: {unfollowed_id: follow.followed.id, follower_id: current_user.id}
      end
    end
  end
end
