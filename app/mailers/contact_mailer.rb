class ContactMailer < ApplicationMailer

  def send_admin_mail(contact)
    @contact = contact
    mail to: ENV['SMTP_USERNAME'], subject: "【だげほー】 お問い合わせ"
  end
  
  def send_user_mail(contact)
    @contact = contact
    mail to: @contact.email, subject: "【だげほー】 お問い合わせありがとうございます"
  end

end
