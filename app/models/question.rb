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

  validate :validation_answers_count_range, on: :update

  def validation_answers_count_range
    unless answers_count_in_range?
      error = "must include from X to N answer count: #{Setting.answers_range}"
      errors.add(:question, error)
    end
  end

  def answers_count_in_range?
    Setting.answers_range.include?(answers.count)
  end
end
