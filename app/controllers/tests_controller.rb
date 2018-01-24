class TestsController < ApplicationController
  
  before_action :find_test, only: %i[show update edit]

  def index
    @tests = Test.all.order(:category_id, :title, :level)
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    @test.update(test_params)
    
    if @test.errors.present?
      render :edit
    else
      redirect_to @test
    end
  end

  private
  
  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
