class User < ApplicationRecord
  has_secure_password

  has_many :posts

  scope :sorted, -> { order(:username => :asc) }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :username, prescence: true, uniqueness: true, length: {within: 8..25}
  validates :email, format: EMAIL_REGEX, confirmation: true
end
