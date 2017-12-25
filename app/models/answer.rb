class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects, -> { where(correct: true) }
end
