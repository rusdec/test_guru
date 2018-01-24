class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :user_id, numericality: { only_integer: true }
  validates :test_id, numericality: { only_integer: true }
  validates :begin_at, presence: true
end
