class SessionsController < ApplicationController
  before_action :already_authenticated_user!, only: %i[new]

  def new
  end
  
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:target_request] ? session[:target_request] : root_path
    else
      flash.now[:alert] = "Авторизуйтесь с помощью эл.почты и пароля"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
