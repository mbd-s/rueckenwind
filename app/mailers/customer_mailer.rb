class CustomerMailer < ApplicationMailer
  default from: 'welcome@rueckenwind-dev.com'

  def email_confirmation(customer)
    @customer = customer
    mail(to: @customer.email, subject: 'Thanks for your order.')
  end
end
