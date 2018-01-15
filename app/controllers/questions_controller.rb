class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]

  def create
    question = @test.questions.new(question_params)
    result = question.save! ? 'Вопрос создан.'
                            : 'Ошибка. Вопрос не создан.'
    render plain: result
  end

  def destroy
    result = Question.destroy(params[:id]) ? 'Вопрос удалён.'
                                           : 'Ошибка. Вопрос не удалён.'
    render plain: result
  end

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: Question.find(params[:id]).inspect
  end

  private

  def question_params
    params.permit(:body, :level)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
