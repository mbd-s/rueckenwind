class OrdersController < ApplicationController

  before_action :authenticate_user!, :except => [:new, :create, :show]
  before_action :authorize

  def index
    @orders = Order.all
  end

  def new
    if session[:current_customer_id].nil?
      redirect_to new_customer_path, error: "Please enter your contact information first."
    else
      @order = Order.new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = session[:current_customer_id]
    @order.status = "ordered"
    if @order.save
      CustomerMailer.order_confirmation(@order.customer).deliver
      redirect_to "/pages/confirmation", notice: "Thanks for your order!"
    else
      redirect_to new_order_path, error: @order.errors.full_messages.to_sentence
    end
  end

  def edit
    @order = Order.find(params[:id])
    render :edit
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path, notice: "Order updated."
    else
      flash[:error] = @order.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, notice: "Order deleted."
  end

  private

  def order_params
    params.require(:order).permit(:mens_bikes, :womens_bikes, :kids_bikes, :notes, :invitation_sent, :confirmed, :customer_id)
  end

end
