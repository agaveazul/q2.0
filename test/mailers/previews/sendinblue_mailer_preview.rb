class SendinblueMailerPreview < ActionMailer::Preview

  #http://localhost:3000/rails/mailers/Sendinblue_Mailer/account_activation
  def account_activation
    SendinblueMailer.account_activation
  end

  #http://localhost:3000/rails/mailers/SendinblueMailer/password_reset
  def password_reset
    SendinblueMailer.password_reset
  end

end
