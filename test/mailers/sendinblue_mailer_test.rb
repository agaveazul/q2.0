require 'test_helper'

#preview all emails at http://localhost:3000/rails/mailers/sendinblue_mailer
class SendinblueMailerTest < ActionMailer::TestCase
  def account_confirmation_email
    SendinblueMailer.account_confirmation_email(User.first)
  end
end
