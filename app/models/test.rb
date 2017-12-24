class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages

  belongs_to :category
  has_many :questions

  class << self
    def all_by_category(category_title)
      joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
    end
  end
end
