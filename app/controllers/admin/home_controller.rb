class Admin::HomeController < Admin::BaseController

  before_action :set_tests, only: %[index]
  before_action :set_users, only: %[index]
  before_action :set_gists, only: %[index]

  def index
  end

  private

  def set_gists
    @gists = Gist.all
  end

  def set_tests
    @tests = Test.all
  end

  def set_users
    @users = User.all
  end
end
