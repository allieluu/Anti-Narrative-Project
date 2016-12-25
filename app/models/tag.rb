class Tag < ApplicationRecord
  has_many :tag_sets
  has_many :posts, through: :tag_sets

  validates :name, :presence => true, :length => {within: 1..255}
end
