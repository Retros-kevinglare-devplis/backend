class UserMailer < ApplicationMailer
  def sign_up
    email = params[:email]
    mail(to: email, subject: 'Добро пожаловать на retrosprint.ru')
  end
end
