module QuestionsHelper

  def question_header(question)
    action = question.persisted? ? 'Редактирование' : 'Создание'

    tag.h1 "#{action} вопроса теста \"#{question.test.title}\""
  end

end
