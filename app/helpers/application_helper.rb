module ApplicationHelper
  def avatar(variant, user = current_user)
    if user.blank? || !user.avatar.attached?
      map_of_sizes = { thumb: 256, small: 32, medium: 64 }
      image_tag "default_avatar_#{map_of_sizes[variant]}.png"
    else
      image_tag user.avatar.variant(variant), class: "rounded"
    end
  end
end
