class CustomerMailer < ApplicationMailer
  default from: 'welcome@rueckenwind-dev.com'

  def email_confirmation(customer)
    @url = "#{default_url_options[:scheme]}#{default_url_options[:host]}#{default_url_options[:port]}/confirm/#{customer.id}"
    @customer = customer
    mail(to: @customer.email, subject: 'Thanks for your order.')
  end
end
