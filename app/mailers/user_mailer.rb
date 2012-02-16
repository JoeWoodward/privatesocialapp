class UserMailer < ActionMailer::Base
  default from: "48 Harley Street Notifier <48harleystreet.notifier@gmail.com>"
  def reset_password_email(user)
    @user = user
    @url  = "http://178.79.159.74/password_resets/#{user.reset_password_token}/edit"
    mail(:to => "#{user.full_name}<#{user.email}>",
         :subject => "Password reset confirmation from 48 Harley Street")
  end
end
