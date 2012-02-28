class AskAQuestionMailer < ActionMailer::Base
  default to: ENV['ASK_A_DOCTOR_EMAIL_ADDRESS'],
          from: "48 Harley Street Notifier <48harleystreet.notifier@gmail.com>"
  def the_users_question(user_full_name, user_email, question)
    @name = user_full_name
    @question = question
    @email = user_email
    mail(:subject => "#{user_full_name} has asked a question")
  end
end
