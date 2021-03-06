class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user_badges = current_user.badges.uniq
    @test_passages = current_user.test_passages.completed
    @badges = Badge.active
  end
end
