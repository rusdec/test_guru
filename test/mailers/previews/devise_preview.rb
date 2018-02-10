# Preview all emails at http://localhost:3000/rails/mailers/devise
class DevisePreview < ActionMailer::Preview
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(user, token, opts)
  end
  
  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(user, token, opts)
  end

  def unlock_instructions
    Devise::Mailer.unlock_instructions(user, token, opts)
  end

  def email_changed
    Devise::Mailer.email_changed(user, opts)
  end

  def password_change
    Devise::Mailer.password_change(user, opts)
  end

  private

  def user
    User.last
  end

  def token
    '1488xxxx'
  end

  def opts
    {}
  end
end
