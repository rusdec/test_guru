class ContactController < ApplicationController

  before_action :contactable_emails, only: :send_message
  before_action :set_message, only: :send_message
  before_action :set_email, only: :send_message
  before_action :set_user, only: :index
  
  add_flash_types :success

  def send_message
    if @message.empty?
      flash_message = { alert: t('.empty_message') }
    elsif email_invalid?
      flash_message = { alert: t('.invalid_email') }
    else
      result = ContactMailer.contact_us(recipients: @recipients,
                                        message: @message,
                                        sender: @email).deliver_now
      flash_message = result.errors ? { success:  t('.send_success') } :
                                      { alert:    t('.send_failure') }
    end

    redirect_to contact_path, flash_message
  end

  private

  def set_user
    @user = current_user || default_user
  end

  def set_email
    @email = params[:email]
  end

  def set_message
    @message = params[:message]
  end

  def default_user
    OpenStruct.new(email: '')
  end

  def contactable_emails
    @emails = Admin.contactable.pluck(:email)
  end

  def email_invalid?
    email_format !~ @email
  end

  def email_format
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z|\A\Z/i
  end
end
