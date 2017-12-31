class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects, -> { where(correct: true) }
  
  validates :body, presence: true
  validates :question_id, presence: true,
                          numericality: { only_integer: true }

  validate :validate_answers_count_max

  private

  def validate_answers_count_max
    if answers_count_max?
      error = "must include from #{question.min_answers} to #{question.max_answers} answers"
      errors.add(:question_id, error)
    end
  end

  def answers_count_max?
    question.answers.count >= question.max_answers
  end
end
