module TestPassagesHelper
  def test_passage_result(test_passage)
    tag.span "#{result_status(test_passage)}",
             class: ["#{result_color(test_passage)}"]
  end

  def current_question_number(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

  def result_status(test_passage)
    test_passage.passed? ? t('.test_passed') : t('.test_failed')
  end

  def result_color(test_passage)
    test_passage.passed? ? 'passed-true' : 'passed-false'
  end

  def passed_icon(test_passage)
    if test_passage.passed?
      tag.i class: 'far fa-check-circle passed-true'
    else
      tag.i class: 'far fa-times-circle passed-false'
    end
  end

  def test_completed_date(test_passage)
    date = test_passage.updated_at.getlocal
    time = tag.span date.strftime('(%H:%M)'), class: "text-muted"
    tag.span  "#{date.strftime('%d.%m.%Y')} #{time}".html_safe
  end

  def elapsed_time(test_passage)
    sec_num = test_passage.updated_at - test_passage.created_at
    hours = (sec_num/3600).round
    minutes = ((sec_num - (hours*3600))/60).round
    seconds = (sec_num - (hours*3600) - (minutes*60)).round

    hours = "0#{hours}" if hours < 10
    minutes = "0#{minutes}" if minutes < 10
    seconds = "0#{seconds}" if seconds < 10

    "#{hours}:#{minutes}:#{seconds}"

  end
end
