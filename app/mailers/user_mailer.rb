class UserMailer < ActionMailer::Base
  default from: "mail@wfsneto.com.br"

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "Bem vindo ao gostozinho")
  end
end
