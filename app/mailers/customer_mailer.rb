# frozen_string_literal: true

class CustomerMailer < ApplicationMailer
  default from: 'no-reply@rueckenwind.berlin'

  def email_confirmation(customer)
    @url = "#{default_url_options[:scheme]}#{default_url_options[:host]}#{default_url_options[:separator]}#{default_url_options[:port]}/confirm/#{customer.confirm_token}"
    @customer = customer
    logo
    mail(to: @customer.email, subject: 'Welcome to Rückenwind! Please confirm your email address')
  end

  def order_confirmation(order)
    @order = order
    logo
    mail(to: @order.customer.email, subject: 'Thanks for your order!')
  end

  def invitation(event, order)
    @confirmation_url = confirm_invitation_order_url(order)
    @decline_url = decline_invitation_order_url(order)
    @cancel_url = cancel_order_url(order)
    @event = event
    @order = order
    logo
    mail(to: @order.customer.email, subject: 'Invitation from Rückenwind')
  end

  private

  def logo
    attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
  end
end
