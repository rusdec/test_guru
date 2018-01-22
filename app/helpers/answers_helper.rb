module AnswersHelper

  def answer_header(answer)
    action = answer.persisted? ? 'Редактирование' : 'Создание'

    tag.h1 "#{action} ответа на вопрос"
  end

end
