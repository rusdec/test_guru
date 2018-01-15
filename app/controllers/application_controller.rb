class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_find

  private
  
  def not_find
    render inline: '<h2>Запись не найдена.</h2>', status: 404
  end 
end
