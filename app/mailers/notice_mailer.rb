class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_registration.subject
  #
  def sendmail_registration(registration)
    @greeting = "Hi"

    mail to: "killingdoll135@icloud.com"
      subject: '登録ありがとうございます'
  end
end
