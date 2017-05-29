# Preview all emails at http://localhost:3000/rails/mailers/bets_mailer
class BetsMailerPreview < ActionMailer::Preview
  def bets_mail
    BetsMailer.bets_mail(User.where(email: 'pfnieto@uc.cl').first, Match.where(id: 1).first, 10)
  end

end
