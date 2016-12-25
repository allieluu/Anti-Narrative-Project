class User < ApplicationRecord
  has_permalink :username
  has_secure_password

  has_many :posts
  has_many :tags, through: :posts

  scope :sorted, -> { order(:username => :asc) }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :username, presence: true, uniqueness: true, length: {within: 8..25}
  validates :email, presence: true, format: EMAIL_REGEX
  validates :password, presence: true, length: {minimum: 8}, confirmation: true

end
