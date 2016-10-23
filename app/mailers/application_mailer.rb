class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@rueckenwind.berlin"
  layout 'mailer'
end
