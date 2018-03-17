class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_one :user_badge, as: :resource
  has_one :badge, through: :user_badge

  scope :completed, -> { where(completed: true) }
  scope :passed, -> { where(passed: true) }
  scope :failed, -> { completed.where(passed: false) }

  validates :user_id, numericality: { only_integer: true }
  validates :test_id, numericality: { only_integer: true }

  before_validation :before_validation_set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def questions_total
    test.questions.count
  end

  def passing_percent
    85
  end

  def result_percent
    ((correct_questions.to_f / questions_total) * 100).floor
  end

  def current_question_index
    questions_ordered_by_id.index(current_question)
  end

  def must_finished?
    completed? || time_left?
  end

  def finish!
    self.passed = result_percent >= passing_percent
    self.completed = true
    save!
  end

  def remaining_seconds
    seconds = (timer_seconds) - seconds_since_created_at
    seconds > 0 ? seconds : 0
  end

  def time_left?
    test.with_timer? && created_at.since(timer_seconds) <= time_now
  end

  private

  def seconds_since_created_at
    time_now.to_i - created_at.to_i
  end

  def time_now
    Time.zone.now
  end

  def timer_seconds
    timer*60
  end

  def timer
    test.timer
  end

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
    return if completed?
    if current_question.nil?
      questions_ordered_by_id.first
    else
      question = questions_ordered_by_id.where('id > ?', current_question.id).first
      test_completed if question.nil?
      question
    end
  end

  def test_completed
    self.completed = true
  end

  def questions_ordered_by_id
    test.questions.order(:id)
  end
end
