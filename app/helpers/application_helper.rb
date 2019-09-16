module ApplicationHelper
  # Этот метод возвращает ссылку на аватарку пользователя, если она у него есть.
  # Или ссылку на дефолтную аватарку, которую положим в app/assets/images
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
end
