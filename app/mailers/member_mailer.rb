class MemberMailer < ActionMailer::Base
  default from: "no-reply@altimarc.com"

  def welcome(user_id)
    @user = User.find(user_id)
    @email = @user.email
    @subject = "Welcome to Altimarc"
    headers['X-Campaign-Id'] = "UserSignup"
    mail(to: @email, subject: @subject)
  end
  
  def subscribed(user_id, amount, description)
    @user = User.find(user_id)
    @description = description
    @amount = amount
    @subject = "Subscription For - #{@user.email} - #{@description}}"
    mail(to: "orders@altimarc.com", subject: @subject)
  end

end
