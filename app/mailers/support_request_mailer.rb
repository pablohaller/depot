class SupportRequestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support_request_mailer.respond.subject
  #
  def respond
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
