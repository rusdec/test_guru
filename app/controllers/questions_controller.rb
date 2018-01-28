class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[create new]
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
    @test = @question.test
  end

  def update
    @test = @question.test

    if @question.update(question_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to @question.test
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
