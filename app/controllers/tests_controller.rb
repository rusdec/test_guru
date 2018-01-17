class TestsController < ApplicationController
  def index
    tests = Test.all
    render plain: Test.all.pluck
  end
end
