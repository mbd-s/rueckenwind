# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@rueckenwind.berlin'
  layout 'mailer'
end
