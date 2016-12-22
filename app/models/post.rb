class Post < ApplicationRecord
  belongs_to :user

  scope :sorted, -> { order(:updated_at => :desc) }
  scope :search_by_title, ->(query) { where(["title LIKE ?", "%#{query}"]) }
  scope :search_by_user, ->(query) { where(["user_id LIKE ?", "%#{query}"]) }
end
