class SendinblueMailer < ApplicationMailer
  default from: "q.music.playlist@gmail.com"

  def account_confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
