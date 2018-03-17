class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
    @user_badges = current_user.badges.uniq
    @badges = Badge.active
  end
end
