class CustomerMailer < ApplicationMailer
  default from: 'welcome@rueckenwind-dev.com'

  def order_email(customer)
    @customer = customer
    @url  = 'http://localhost:3000/'
    mail(to: @customer.email, subject: 'Thanks for your order.')
  end
end
