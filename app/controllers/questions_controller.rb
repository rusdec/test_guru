class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  rescue_from ActiveRecord::RecordNotFound, with: :not_find

  # Для тестирования post-запросов
  skip_before_action :verify_authenticity_token

  def create
    question = Question.new(
      body: params[:body],
      test_id: params[:test_id]
    )
    question[:level] = params[:level] unless params[:level].nil?
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

  def not_find
    render inline: '<h2>Запись не найдена.</h2>', status: 404
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
