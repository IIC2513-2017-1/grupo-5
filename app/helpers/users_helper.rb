module UsersHelper
  def following_button(user)
    return unless current_user
    return if user == current_user
    following_relation = user.follower_relationships.detect do |relation|
      relation.follower_id == current_user.id
    end
    if following_relation
      link_to 'Unfollow', follower_path(following_relation), method: 'delete'
    else
      link_to 'Follow', user_followers_path(user), method: 'post'
    end
  end
end
