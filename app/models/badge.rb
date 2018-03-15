class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges
  has_many :resources, through: :user_badges

  scope :active, -> { where(is_active: true) }
  scope :by_rule, ->(rule) { find_by(rule: rule) }
end
