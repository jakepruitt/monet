module ApplicationHelper
  def resolve_user_avatar(user)
    if user.avatar.exists?
      return user.avatar.url
    end
    return 'default_profile.jpg'
  end
end
