class Question < ApplicationRecord
  # Эта команда добавляет связь с моделью User на уровне объектов, она же
  # добавляет метод .user к данному объекту.

  # Когда мы вызываем метод user у экземпляра класса Question, рельсы
  # поймут это как просьбу найти в базе объект класса User со значением id,
  # который равен question.user_id.
  belongs_to :user

  # Имя этой связи важно:
  # рельсы добавят к нему `_id` и найдут нужное поле в таблице
  belongs_to :author, class_name: 'User', optional: true

  # Создаём прямое соединение многие-ко-многим с другой моделью,
  # без промежуточной модели. Например, если ваше приложение включает
  # вопросы (questions) и хештеги (hashtags), где каждый вопрос имеет много
  # хештегов, и каждый хештег встречается во многих вопросах
  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true

  # Задача 49-1 — Валидации: email, username
  # Пункт 4. Проверка максимальной длины текста вопроса (максимум 255 символов)
  validates :text, length: { maximum: 255 }

  before_save :find_hashtags

  # before_validation :before_validation
  # after_validation :after_validation
  #
  # before_save :before_save
  # after_save :after_save
  #
  # before_create :before_create
  # after_create :after_create
  #
  # before_update :before_update
  # after_update :after_update
  #
  # before_destroy :before_destroy
  # after_destroy :after_destroy
  #
  # # Этот код нужен только для демонстрации валидаций, потом мы его удалим.
  # # Код создаёт все возможные пары методов before_validation, after_validation, before_save и так далее.
  #
  # %w(validation save create update destroy).each do |action|
  #   %w(before after).each do |time|
  #     define_method("#{time}_#{action}") do
  #       puts "******> #{time} #{action}"
  #     end
  #   end
  # end

  def find_hashtags
    self.hashtags = "#{text} #{answer}".scan(/#[a-zA-Zа-яА-Я0-9_-]+/).
      map { |word| word.downcase }.uniq.
      map { |word| Hashtag.find_or_create_by(name: word) }
  end
end
