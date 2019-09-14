class Question < ApplicationRecord
  # Эта команда добавляет связь с моделью User на уровне объектов, она же
  # добавляет метод .user к данному объекту.
  #
  # Когда мы вызываем метод user у экземпляра класса Question, рельсы
  # поймут это как просьбу найти в базе объект класса User со значением id,
  # который равен question.user_id.
  belongs_to :user

  validates :text, :user, presence: true

  # Задача 49-1 — Валидации: email, username
  # Пункт 4. Проверка максимальной длины текста вопроса (максимум 255 символов)
  validates :text, length: { maximum: 255 }

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
end
