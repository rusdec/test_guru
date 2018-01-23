class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  validates :user_id, numericality: { only_integer: true }
  validates :test_id, numericality: { only_integer: true }
end
