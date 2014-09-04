class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation user
    @user = user
    mail to: user.email, subject: "Welcome to the Clone"
  end

  def tag_notification(user, beep)
    @user = user
    @beep = beep
    mail to: user.email, subject: "You were mentioned in #{beep.user.name}'s Beep"
  end
end
