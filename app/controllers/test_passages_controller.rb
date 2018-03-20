class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :check_timer, only: :update

  add_flash_types :success

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.completed?
  end

  def result
    unless @test_passage.completed? || @test_passage.time_left?
      redirect_to test_passage_path(@test_passage)
    end
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.finish!
      BadgeGrantService.call(event: :test_passage_complete,
                             flash: flash,
                             params: { resource: @test_passage,
                                       user: current_user })
      #TestsMailer.completed_test(@test_passage).deliver_now

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
  rescue Octokit::Error
    redirect_to @test_passage, { alert: t('.failure') } 
  else
    gist = current_user.gists.new
    gist.register(url: result.html_url, question_id: @test_passage.current_question.id)
    redirect_to @test_passage, { success: t('.success', url: result.html_url) }
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_timer
    if @test_passage.time_left?
      @test_passage.finish_by_timeout!
      redirect_to result_test_passage_path(@test_passage), { alert: t('.time_left') }
    end
  end
end
