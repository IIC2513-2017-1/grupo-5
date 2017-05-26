# Preview all emails at http://localhost:3000/rails/mailers/register_mailer
class RegisterMailerPreview < ActionMailer::Preview
  def register_mail
    RegisterMailer.register_mail(User.where(email: 'alopez7@uc.cl').first)
  end

end
