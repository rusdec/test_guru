module QuestionsHelper

  def question_header
    action = @question.persisted? ? 'Редактирование' : 'Создание'

    tag.h1 "#{action} вопроса теста \"#{@test.title}\""
  end

end
