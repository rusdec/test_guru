module QuestionsHelper
  def question_header(question)
    action = question.persisted? ? 'Редактирование' : 'Создание'

    "#{action} вопроса теста \"#{question.test.title}\""
  end
end
