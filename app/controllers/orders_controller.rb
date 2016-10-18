class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    if session[:current_customer_id].nil?
      flash[:error] = "Sorry, nothing to see here."
      redirect_to new_customer_path
    else
      @order = Order.new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = session[:current_customer_id]
    if @order.save
      flash[:success] = "Thank you! Check your email for confirmation of your order."
      redirect_to root_path
    else
      flash[:error] = @order.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    render :show
  end

  private

  def order_params
    params.require(:order).permit(:mens_bikes, :womens_bikes, :kids_bikes, :notes, :invitation_sent, :confirmed, :customer_id)
  end

end
