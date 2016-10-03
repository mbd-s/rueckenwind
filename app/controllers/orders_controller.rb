class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = session[:current_customer_id]
    if @order.save
      flash[:success] = "Order successfully saved."
      redirect_to root_path
    else
      flash[:error] = @order.errors.full_messages.to_sentence
      render :new
      end
  end

  private

  def order_params
    params.require(:order).permit(:mens_bikes, :womens_bikes, :kids_bikes, :notes, :invitation_sent, :confirmed, :customer_id)
  end

end
