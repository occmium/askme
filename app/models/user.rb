require 'uri'
require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  before_validation :username_in_lowercase

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /@/ } # для типа "админ@почта.рф"

  validates :username,
            length: { maximum: 40 },
            format: { with: /\A[\w]+\z/ }

  validates :background_color,
            allow_blank: true,
            format: { with: /\A\#([a-fA-F]|[0-9]){3,6}\z/ }

  attr_accessor :password
  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    return user if user.password_hash == hashed_password

    nil
  end

  def username_in_lowercase
    self.username = username&.downcase
  end
end
