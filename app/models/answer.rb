class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }
  default_scope { order(:sort) }

  validates :body, presence: true
  validates :question_id, presence: true,
                          numericality: {
                            only_integer: true,
                            greater_then_or_equal_to: 0
                          }

  validate :validate_answers_count_max, on: :create

  private

  def validate_answers_count_max
    if answers_count_max?
      errors.add(:question, "must include #{Setting.max_answers} answers")
    end
  end

  def answers_count_max?
    question.answers.count >= Setting.max_answers
  end
end
