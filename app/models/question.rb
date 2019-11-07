class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  before_save :find_hashtags

  def find_hashtags
    self.hashtags = "#{text} #{answer}".scan(/#[a-zA-Zа-яА-Я0-9_-]+/).
      map { |word| word.downcase }.uniq.
      map { |word| Hashtag.find_or_create_by(name: word) }
  end
end
