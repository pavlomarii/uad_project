module ApplicationHelper
  def avatar
    if current_user.blank? || !current_user.avatar.attached?
      image_tag "default_avatar.png"
    else
      image_tag current_user.avatar.variant(:thumb), class: "rounded"
    end
  end
end
