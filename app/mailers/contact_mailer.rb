class ContactMailer < ApplicationMailer
  def contact_us(params)
    @message = params[:message] || ''
    @recipients = params[:recipients] || contactable_emails
    @sender = params[:sender]

    mail to: @recipients
  end

  private

  def contactable_emails
    Admin.contactable.pluck(:email)
  end
end
