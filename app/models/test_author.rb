class TestAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :test
  
  validates :user_id, presence: true,
                      numericality: { only_integer: true }
  validates :test_id, presence: true,
                      numericality: { only_integer: true }
end
