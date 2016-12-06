class EventsController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize
  before_action :set_event, only: [:edit, :update, :destroy, :add_customer, :save_customer]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @organizers = User.admin_and_organizers
    @volunteers = User.volunteers
    @customers = Customer.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      save_event_volunteers(@event, params[:volunteer_ids])
      redirect_to events_path, notice: "Event created."
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      redirect_to new_event_path
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Event updated."
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    event_id = params[:id]
    Order.where(event_id: event_id).update_all(event_id: nil)
    @event.destroy
    redirect_to events_path, notice: "Event deleted."
  end

  def add_customer
    @orders = Order.order(created_at: :desc)
  end

  def save_customer
    event_id = params[:id]
    order_ids = params[:order_ids]
    Order.where(event_id: event_id).update_all(event_id: nil)

    unless order_ids.nil?
      order_ids.each do |order_id|
        order = Order.find(order_id)
        order.event_id = event_id
        order.save
      end
    end

    redirect_to add_customer_event_path(@event), notice: "Event updated."
  end

  private

  def event_params
    params.require(:event).permit(:date, :start_time, :end_time, :organizer_id, :volunteer_spaces)
  end

  def save_event_volunteers(event, volunteers)
    unless volunteers.nil?
      volunteers.each do |v|
        EventVolunteer.new(event_id: event.id, user_id: v).save
      end
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
