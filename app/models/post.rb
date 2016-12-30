class Post < ApplicationRecord
  has_permalink

  belongs_to :user

  has_many :tag_sets
  has_many :tags, through: :tag_sets

  scope :sorted, -> { order(:updated_at => :desc) }
  scope :search_by_title, ->(query) { where(['title LIKE ?', "%#{query}"]) }
  scope :search_by_user, ->(query) { where(['user_id LIKE ?', "%#{query}"]) }

  validates :title, :presence => true, :length => {within: 1..255}
  validates :content, :presence => true, :length => {minimum: 10}

  # Setter
  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  # Getter
  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def self.get_username(id)
    User.find(id).username
  end
end
