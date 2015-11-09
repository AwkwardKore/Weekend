class User < ActiveRecord::Base
  has_secure_password

  has_many :favorite_places
  has_many :places, through: :favorite_places

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, length: { maximum: 200},
            format: { with: VALID_EMAIL_REGEX, message: "%{value} is reserved." },uniqueness:{ case_sensitive: false }

end
