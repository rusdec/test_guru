class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges
  has_many :resources, through: :user_badges

  scope :active, -> { where(active: true) }
  scope :by_rule, ->(rule) { find_by(rule: rule) }

  validates :rule, presence: true,
                   uniqueness: true
  validates :image, presence: true
  validates :title, presence: true,
                    length: { minimum: 6, maximum: 25 }
  validates :description, presence: true,
                          length: { minimum: 10, maximum: 50 }
  validates :multiple, inclusion: { in: [true, false] } 
  validates :active, inclusion: { in: [true, false] } 

end
