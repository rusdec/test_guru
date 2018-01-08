class Question < ApplicationRecord
  belongs_to :test

  has_many :answers
  
  validates :body, presence: true

  validates :level, presence: true,
                    numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 0 
                                  }

  validates :test_id, presence: true,
                      numericality: { only_integer: true }

  validate :validation_answers_count_range, on: :update

  def validation_answers_count_range
    if answers_count_out_of_range?
      error = "must include from #{min_answers} to #{max_answers} answers"
      errors.add(:question, error)
    end
  end

  def answers_count_out_of_range?
    !answers_count_in_range?
  end

  def answers_count_in_range?
    (min_answers..max_answers).include?(answers.count)
  end  
end
