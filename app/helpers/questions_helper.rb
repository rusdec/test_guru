module QuestionsHelper
  def question_header(question)
    question.persisted? ? t('.edit_question') : t('.new_question')
  end
end
