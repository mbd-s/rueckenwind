# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      CustomerMailer.email_confirmation(@customer).deliver
      redirect_to confirmation_page_url('confirmation')
      flash[:notice] = 'Check your inbox to complete your order!'
    else
      flash[:error] = @customer.errors.full_messages.to_sentence
      redirect_to new_customer_path
    end
  end

  def confirm
    @customer = Customer.find_by_confirm_token(params[:token])
    if @customer.nil?
      flash[:error] = "We couldn't find your information. Please try again."
      redirect_to new_customer_path
    else
      session[:current_customer_id] = @customer.id
      redirect_to new_order_path, notice: "Thanks for confirming your email address.
        You can now complete your order."
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone,
                                     :facebook, :has_donated, :signed_up, :wants_to_be_mechanic)
  end
end
