module EventsHelper
  def invite_button(user, event)
    return unless current_user && current_user.role != 1
    inv = Invitation.where(user_id: user.id, event_id: event.id).first
    if inv
      link_to 'Uninvite', invitation_path(inv), method: 'delete', remote: true, data: {type: 'json', 'user-id': user.id}, class: "link-button"
    else
      link_to 'Invite', event_invitations_path(event_id: event.id, user_id: user.id), method: 'post', remote: true, data: {type: 'json', 'user-id': user.id}, class: "link-button"
    end
  end

  def need_request?(event)
    return false unless event.private
    return false unless current_user
    return false unless current_user.id != event.user_id
    foll = Follow.where(follower_id: event.user_id, followed_id: current_user.id).first
    if foll
      return false
    else
      return true
    end
  end
end
