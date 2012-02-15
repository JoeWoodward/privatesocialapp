class AskAQuestionMailer < ActionMailer::Base
  default to: "test@mail.com"
  def the_users_question(user_full_name, user_email, question)
    @name = user_full_name
    @question = question
    mail(:from => "#{user_full_name} <#{user_email}>", :subject => "#{user_full_name} has asked a question")
  end
end
