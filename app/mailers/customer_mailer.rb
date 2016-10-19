class CustomerMailer < ApplicationMailer
  default from: 'rueckenwind.no.reply@gmail.com'

  def email_confirmation(customer)
    @url = "#{default_url_options[:scheme]}#{default_url_options[:host]}#{default_url_options[:port]}/confirm/#{customer.id}"
    @customer = customer
    mail(to: @customer.email, subject: 'Welcome to Rückenwind! Please confirm your email')
  end
end
