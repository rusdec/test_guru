class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  validates :user_id, numericality: { only_integer: true }
  validates :test_id, numericality: { only_integer: true }

  before_validation :before_validation_set_next_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def questions_total
    test.questions.count
  end

  def passing_percent
    85
  end

  def success?
    result_percent >= passing_percent
  end

  def result_percent
    ((correct_questions.to_f / questions_total) * 100).floor
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.where(id: answer_ids).count == correct_answers.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.order(:id).first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
