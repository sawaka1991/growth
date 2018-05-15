class GrowthMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_when_update.subject
  #
  def send_when_create(history)
  	@history = history
    @user = history.user
    mail to:      history.user.email,
         subject: 'ご予約を承りました。-Growth-'
  end
end
