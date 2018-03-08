# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_us_test
    params = { message: 'Test text. Тестовый текст' }

    ContactMailer.contact_us(params)
  end
end
