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

  def declension(quantity, question, questions_rus, questions)
    return questions if (quantity % 100).between?(11, 14)

    case quantity % 10
    when 1 then question
    when 2..4 then questions_rus
    else questions
    end
  end
end
