module ApplicationHelper
  def resolve_user_avatar(user)
    if user.avatar.exists?
      return user.avatar.url
    end
    return 'default_profile.jpg'
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end
end
