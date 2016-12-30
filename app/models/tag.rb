class Tag < ApplicationRecord
  has_permalink :name

  has_many :tag_sets
  has_many :posts, through: :tag_sets

  scope :search_by_name, -> (query) { where(['name LIKE ?', "%#{query}"]) }
  scope :sorted, -> { order(:name => :asc) }

  validates :name, presence: true, length: {within: 1..255}, uniqueness: true

end
