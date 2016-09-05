class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to root_path
    else
      flash[:error] = @orders.errors.full_messages.to_sentence
      render :new
      end
  end

  private

  def order_params
    params.require(:order).permit(:mens_bikes, :womens_bikes, :kids_bikes, :notes, :invitation_sent, :confirmed)
  end

end
