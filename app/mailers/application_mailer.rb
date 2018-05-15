class ApplicationMailer < ActionMailer::Base
  default from:     "Growth",
          bcc:      "sapa61s@gmail.com",
          reply_to: "sapa61s@gmail.com"
  layout 'mailer'
end
