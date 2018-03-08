module AnswersHelper
  def answer_header(answer)
    action = answer.persisted? ? t('.edit_answer') : t('.new_answer')
  end

  def new_answer_button(question)
    klass = "btn light-button mb-2"
    klass << " disabled" if question.answers.count >= Setting.max_answers

    link_to t('.new_answer'),
            new_admin_question_answer_path(question),
            class: klass
  end
end
