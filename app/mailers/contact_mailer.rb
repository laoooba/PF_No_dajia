class ContactMailer < ApplicationMailer

  def send_admin_mail(contact)
    @contact = contact
  mail(
    from: @contact.email,
    to:   ENV['SMTP_USERNAME'],
    subject: 'お問い合わせ通知'
  )
  end
  
  def send_user_mail(contact)
    @contact = contact
    mail(
    from: ENV['SMTP_USERNAME'],
    to:   @contact.email,
    subject: 'お問い合わせ'
  )
  end
  
  def send_user_reply(contact)
    @contact = contact
    mail(
    from: ENV['SMTP_USERNAME'],
    to:   @contact.email,
    subject: 'お問い合わせの回答'
  )
  end
  
  

end
