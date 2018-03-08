class Question < ApplicationRecord
  belongs_to :test

  has_many :answers

  has_many :gists

  default_scope { order(:level) }

  validates :body, presence: true

  validates :level, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  validates :test_id, presence: true,
                      numericality: { only_integer: true }

  validate :validation_answers_count_max, on: :update

  def validation_answers_count_max
    unless answers_count_max?
      error = "must include max #{Setting.answers_max} answers"
      errors.add(:question, error)
    end
  end

  def answers_count_max?
    Setting.max_answers >= answers.count
  end
end
