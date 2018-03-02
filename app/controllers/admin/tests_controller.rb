class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show update edit start destroy update_inline]

  def index
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      @test.authors.push(current_user)
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def update
    @test.update(test_params)
    
    if @test.errors.present?
      render :edit
    else
      redirect_to [:admin, @test]
    end
  end

  def start
    current_user.tests.push(@test)

    redirect_to current_user.test_passage(@test)
  end

  def destroy
    @test.destroy
    
    redirect_to :admin_tests
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_tests  
    @tests = Test.all.order(:category_id, :title, :level)
  end

  def set_test
    @test = Test.find(params[:id])
  end

end
