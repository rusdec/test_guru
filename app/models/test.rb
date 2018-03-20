class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages

  has_many :test_authors, dependent: :destroy
  has_many :authors, through: :test_authors, source: :user

  has_many :questions

  belongs_to :category

  has_many :user_badges, as: :resource

  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }).order(title: :desc) }
  scope :by_category_and_ids, ->(category, ids) { by_category(category).where(id: ids) }
  scope :by_level, ->(level) { where(level: level) }
  scope :with_timer, -> { where(with_timer: true) }
  scope :without_timer, -> { where(with_timer: false) }

  validates :title, presence: true
  validates :level, presence: true,
                    numericality: { only_integer: true }

  validates :category_id, presence: true,
                          numericality: { only_integer: true }

  validates :title, uniqueness: { scope: :level }

  validates :with_timer, inclusion: { in: [true, false] }
  validates :timer, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 120 }


  class << self
    def all_by_category(category)
      by_category(category).pluck(:title)
    end
  end
end
