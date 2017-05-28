class BetsMailer < ApplicationMailer
  def bets_mail(user, match, ammount)
    @user = user
    @match = match
    @ammount = ammount
    mail subject: "GGEZ: YOU MADE SOME MONEY!", to: user.email

  end
end
