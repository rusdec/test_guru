# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #  super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def after_sign_in_path_for(resource)
    user_name = "#{current_user.first_name} #{current_user.last_name}"
    set_flash_message(:success, :signed_in_greeting, user_name: user_name)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end
end
