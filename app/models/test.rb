class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages

  has_many :test_authors, dependent: :destroy
  has_many :authors, through: :test_authors, source: :user

  has_many :questions

  belongs_to :category

  class << self
    def all_by_category(category_title)
      joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
    end
  end
end
