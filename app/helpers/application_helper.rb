module ApplicationHelper
  def avatar(variant, user = current_user)
    if user.blank? || !user.avatar.attached?
      map_of_sizes = { thumb: 256, small: 32, medium: 64 }
      image_tag "default_avatar_#{map_of_sizes[variant]}.png"
    else
      image_tag user.avatar.variant(variant), class: "rounded"
    end
  end

  def flash_type(type)
    type = case type.to_sym
           when :notice
             :success
           when :alert
             :warning
           when :error
             :danger
           when :timedout
             :dark
           else
             :info
           end
    "alert-#{type}"
  end
end
