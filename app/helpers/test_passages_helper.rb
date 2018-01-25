module TestPassagesHelper

  def test_passage_result(test_passage)
    result_percent = result_percent(test_passage)

    tag.span "тест #{result_status(result_percent)}",
             style: ["color: #{result_color(result_percent)}"]
  end

  def test_passage_progress(test_passage)
    tag.p "Вопрос #{tag.b current_question_number(test_passage)} 
           из #{tag.b questions_total(test_passage)}".html_safe
  end

  def questions_total(test_passage)
    test_passage.test.questions.count
  end

  def current_question_number(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

  def result_percent(test_passage)
    ((test_passage.correct_questions.to_f / questions_total(test_passage)) * 100).floor
  end

  def minimal_good_percent
    85
  end

  def result_status(result_percent)
    if result_percent >= minimal_good_percent
      'пройден'
    else
      'не пройден'
    end
  end

  def result_color(result_percent)
    if result_percent >= minimal_good_percent
      'green'
    else
      'red'
    end
  end
end
