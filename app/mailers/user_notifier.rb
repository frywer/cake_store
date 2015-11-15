class UserNotifier < ApplicationMailer
  default from: "imarangoz.website@gmail.com"

  def user_notifier(email_form)
    @email_form = email_form
    mail(to: "marangoz.frywer@gmail.com", subject: "New user form 'www.shaboo.md' ")
  end
end
