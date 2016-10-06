class CustomersController < ApplicationController

  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:current_customer_id] = @customer.id
      redirect_to new_order_path
    else
      flash[:error] = @customer.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone, :facebook, :has_donated, :signed_up, :wants_to_be_mechanic)
  end

end
