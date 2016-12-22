class Tag < ApplicationRecord
  has_many :tag_sets
  has_many :posts, through: :tag_sets
end
