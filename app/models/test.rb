class Test < ApplicationRecord
  has_and_belongs_to_many :users

  belongs_to :category
  has_many :questions

  class << self
    def all_by_category(category_title)
      select(:title).joins(:category).where('categories.title' => category_title).order(title: :desc).pluck(:title)
    end
  end
end
