module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def declension(quantity, one, few, many)
    return many if (quantity % 100).between?(11, 14)

    case quantity % 10
    when 1 then one
    when 2..4 then few
    else many
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def background_setting(user)
    "#005a55" unless user.background_color?
  end

  def hashtag_to_link(text)
    text.gsub(/#[a-zA-Zа-яА-Я0-9_-]+/) do |word|
      link_to word, hashtag_url(word.downcase)
    end
  end
end
