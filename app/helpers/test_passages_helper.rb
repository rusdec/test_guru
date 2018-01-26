module TestPassagesHelper
  def test_passage_result(test_passage)
    tag.span "тест #{result_status(test_passage)}",
             style: ["color: #{result_color(test_passage)}"]
  end

  def test_passage_progress(test_passage)
    tag.p "Вопрос #{tag.b current_question_number(test_passage)}
           из #{tag.b test_passage.questions_total}".html_safe
  end

  def current_question_number(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

  def result_status(test_passage)
    if test_passage.success?
      'пройден'
    else
      'не пройден'
    end
  end

  def result_color(test_passage)
    if test_passage.success?
      'green'
    else
      'red'
    end
  end
end
