class Category < ApplicationRecord
  has_many :tests
  default_scope { order(title: :asc) }

  scope :by_title, ->(title) { find_by(title: title) }
  validates :title, presence: true
end
