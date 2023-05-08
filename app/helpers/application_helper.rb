module ApplicationHelper
  def avatar(variant)
    if current_user.blank? || !current_user.avatar.attached?
      map_of_sizes = { thumb: 256, small: 32 }
      image_tag "default_avatar_#{map_of_sizes[variant]}.png"
    else
      image_tag current_user.avatar.variant(variant), class: "rounded"
    end
  end
end
