module AnswersHelper
  def answer_header(answer)
    action = answer.persisted? ? 'Редактирование' : 'Создание'

    "#{action} ответа на вопрос"
  end
end
