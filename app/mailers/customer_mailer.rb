class CustomerMailer < ApplicationMailer
  default from: 'no-reply@rueckenwind.berlin'

  def email_confirmation(customer)
    @url = "#{default_url_options[:scheme]}#{default_url_options[:host]}#{default_url_options[:separator]}#{default_url_options[:port]}/confirm/#{customer.confirm_token}"
    @customer = customer
    mail(to: @customer.email, subject: 'Welcome to Rückenwind! Please confirm your email address')
  end

  def order_confirmation(order)
    @order = order
    mail(to: @order.customer.email, subject: 'Thanks for your order!')
  end

end
