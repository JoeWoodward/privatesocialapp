class UserMailer < ActionMailer::Base
  default from: "48 Harley Street Notifier <48harleystreet.notifier@gmail.com>"
  def reset_password_email(user)
    # if the user is admin we want the url to point to the admin area
    user.is_admin? ? admin = "admin/" : admin = ""

    @user = user
    @url  = "http://178.79.159.74/#{admin}password-reset/#{user.reset_password_token}/edit"
    mail(:to => "#{user.full_name}<#{user.email}>",
         :subject => "Password reset confirmation from 48 Harley Street")
  end

  def successful_registration(user, chargify)
    @user = user
    @chargify = chargify
    @url  = "http://178.79.159.74/"
    mail(:to => "#{user.full_name}<#{user.email}>",
         :subject => "Congratulations, you are now a VIP member at 48 Harley Street")
  end
end
