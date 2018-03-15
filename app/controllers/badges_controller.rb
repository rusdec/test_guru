class BadgesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_badges

  def index
    @user = current_user
  end

end
