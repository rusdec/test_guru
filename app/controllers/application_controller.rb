class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_find

  helper_method :current_user,
                :logged_in?
  private
  
  def not_find
    render inline: '<h2>Запись не найдена.</h2>', status: 404
  end 

  def authenticate_user!
    unless current_user
      puts "#{request.methods}"
      session[:target_request] = request.fullpath
      redirect_to login_path, alert: "Авторизуйтесь с помощью эл.почты и пароля"
    end
  end

  def already_authenticated_user!
    redirect_to root_path if current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
