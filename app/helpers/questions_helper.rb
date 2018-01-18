module QuestionsHelper

  def question_header
    if @question.respond_to?(:persisted?) && @question.persisted?
      action = 'Редактирование'
    else
      action = 'Создание'
    end

    tag.h1 "#{action} вопроса теста \"#{@test.title}\""
  end

end
