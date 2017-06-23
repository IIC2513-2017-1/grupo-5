

module UsersHelper
  def following_button(user)
    return unless current_user
    return if user == current_user
    followed_relation = user.followed_relationships.detect do |relation|
      relation.follower_id == current_user.id
    end
    if followed_relation
      link_to 'Unfollow', follow_path(followed_relation), method: 'delete', remote: true, data: { type: 'json', 'user-id': user.id }, class: "link-button"
    else
      link_to 'Follow', user_follows_path(user), method: 'post', remote: true, data: { type: 'json', 'user-id': user.id }, class: "link-button"
    end
  end
end
