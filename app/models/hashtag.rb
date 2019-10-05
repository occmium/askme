class Hashtag < ApplicationRecord
  # Создаём прямое соединение многие-ко-многим с другой моделью,
  # без промежуточной модели. Например, если ваше приложение включает
  # вопросы (questions) и хештеги (hashtags), где каждый вопрос имеет много
  # хештегов, и каждый хештег встречается во многих вопросах
  has_and_belongs_to_many :questions

  validates :name, presence: true, uniqueness: true
end
