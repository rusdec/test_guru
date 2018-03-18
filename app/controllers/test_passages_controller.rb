class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :set_time_left, only: :update

  add_flash_types :success

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.completed?
  end

  def result
    redirect_to test_passage_path(@test_passage) unless @test_passage.must_finished?
  end

  def update
    puts "MUST FIN: #{@test_passage_must_finished}"
    if @time_left
      flash_message = { alert: t('.time_left') }
    else
      @test_passage.accept!(params[:answer_ids])
      flash_message = {}
    end

    if @test_passage.must_finished?
      @test_passage.finish!
      BadgeGrantService.call(event: :test_passage_complete,
                             flash: flash,
                             params: { resource: @test_passage,
                                       user: current_user }) unless @time_left
      #TestsMailer.completed_test(@test_passage).deliver_now

      redirect_to result_test_passage_path(@test_passage), flash_message
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

  def set_time_left
    @time_left = @test_passage.time_left?
  end
end
