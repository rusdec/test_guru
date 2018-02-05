class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: %i[destroy edit show update] 
  before_action :set_test, only: %i[create new]

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    
    if @question.save
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to [:admin, @question.test]
  end

  def show
    @test = Test.find(@question.test_id)
  end

  private

  def question_params
    params.require(:question).permit(:body, :level)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
end
