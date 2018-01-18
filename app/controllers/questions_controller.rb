class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[edit update show destroy] 

  def create
    @question = @test.questions.new(question_params)
    
    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def new
    @question = @test.questions.new
  end

  def edit
    @test = Test.find(@question.test_id)
  end

  def update
    @test = Test.find(@question.test_id)
    @question.update(question_params)

    if @question.errors.present?
      render :edit
    else
      redirect_to @test
    end
  end

  def destroy
    @test = Test.find(@question.test_id)
    @question.destroy

    redirect_to @test
  end

  def show
    @test = Test.find(@question.test_id)
  end

  private

  def question_params
    params.require(:question).permit(:body, :level)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
