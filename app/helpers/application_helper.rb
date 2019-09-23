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

  # этот метод позволяет использовать правильное склонение существительных в
  # зависимости от сопряженоого с существительным числа
  def declension(quantity, one, few, many)
    return many if (quantity % 100).between?(11, 14)

    case quantity % 10
    when 1 then one
    when 2..4 then few
    else many
    end
  end

  # Хелпер, рисующий span тэг с иконкой из font-awesome
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  # Хелпер, подставляющий нужный пользователю цвет
  def background_setting(user, form)
    if user.background_color?
      form.color_field :background_color
    else
      form.color_field :background_color, value: "#005a55"
    end
  end
end
