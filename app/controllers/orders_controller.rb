class OrdersController < ApplicationController

  before_action :authenticate_user!, :except => [:new, :create, :show]
  before_action :authorize

  def index
    @orders = Order.all
  end

  def new
    if session[:current_customer_id].nil?
      flash[:error] = "Please enter your contact information first."
      redirect_to new_customer_path
    else
      @order = Order.new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = session[:current_customer_id]
    if @order.save
      CustomerMailer.order_confirmation(@order.customer).deliver
      flash[:notice] = "Thank you! We've e-mailed you a summary of your order."
      redirect_to "/pages/confirmation"
    else
      flash[:error] = @order.errors.full_messages.to_sentence
      redirect_to new_order_path
    end
  end

  def edit
    @order = Order.find(params[:id])
    render :edit
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "Order successfully updated."
      redirect_to orders_path
    else
      flash[:error] = @order.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Order successfully deleted."
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:mens_bikes, :womens_bikes, :kids_bikes, :notes, :invitation_sent, :confirmed, :customer_id)
  end

end
