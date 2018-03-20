module TestPassagesHelper
  def test_passage_result(test_passage)
    tag.span "#{result_status(test_passage)}",
             style: ["color: #{result_color(test_passage)}"]
  end

  def current_question_number(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

  def result_status(test_passage)
    test_passage.passed? ? t('.test_passed') : t('.test_failed')
  end

  def result_color(test_passage)
    test_passage.passed? ? 'green' : 'red'
  end
end
