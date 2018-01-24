module TestPassagesHelper

  def test_passage_result(test_passage)
    result_percent = result_percent(test_passage)
    message = "тест #{test_passage_result_status(result_percent)}"
    message_color = test_passage_result_color(result_percent)

    tag.span message, style: ["color: #{message_color}"]
  end

  def questions_total(test_passage)
    test_passage.test.questions.count
  end

  private

  def current_question_number(test_passage)
    question_id = test_passage.current_question.id
    question_ids = test_passage.test.questions.order(:id).pluck(:id)

    question_ids.find_index(question_id) + 1
  end

  def result_percent(test_passage)
    ((test_passage.correct_questions.to_f / questions_total(test_passage)) * 100).floor
  end

  def minimal_good_percent
    85
  end

  def test_passage_result_status(result_percent)
    if result_percent >= minimal_good_percent
      'пройден'
    else
      'не пройден'
    end
  end

  def test_passage_result_color(result_percent)
    if result_percent >= minimal_good_percent
      'green'
    else
      'red'
    end
  end
end
