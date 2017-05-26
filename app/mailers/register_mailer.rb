class RegisterMailer < ApplicationMailer
  def register_mail(user)
    @user = user
    ## attachments['juanito_en_la_feca.png'] = File.read('app/assets/images/generic/juanito.png')
    mail subject: "Welcome to GGEZ Bets!", to: user.email
  end
end
