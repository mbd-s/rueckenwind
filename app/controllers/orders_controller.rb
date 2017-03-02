class OrdersController < ApplicationController

  before_action :authenticate_user!, :except => [:new, :create, :show]
  before_action :authorize, except: [:confirm, :decline, :cancel]
  before_action :set_order, only: [:confirm, :decline, :cancel, :edit, :update, :destroy]

  def index
    @orders = Order.all
    respond_to do |format|
      format.html
      format.csv { send_data @orders.to_csv, filename: "orders_#{Date.today.strftime('%d-%b-%Y')}.csv" }
    end
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
      CustomerMailer.order_confirmation(@order).deliver_now
      redirect_to "/pages/confirmation", notice: "Thanks for your order!"
    else
      redirect_to new_order_path, error: @order.errors.full_messages.to_sentence
    end
  end

  def edit
    render :edit
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path, notice: "Order updated."
    else
      flash[:error] = @order.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Order deleted."
  end

  def confirm
    @order.confirmed
    redirect_to confirmation_page_url("confirmation"), notice: "Your spot for the workshop has been reserved."
  end

  def decline
    @order.declined
    redirect_to confirmation_page_url("confirmation"), notice: "Thanks for letting us know. We'll invite you to the next open workshop."
  end

  def cancel
    @order.canceled
    redirect_to confirmation_page_url("confirmation"), notice: "You've been removed from our system. If you change your mind, just sign up again and place a new order."
  end

  private

  def order_params
    params.require(:order).permit(:mens_bikes, :womens_bikes, :kids_bikes, :notes,
    :status, :customer_id, :event_id, :declined_events)
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
