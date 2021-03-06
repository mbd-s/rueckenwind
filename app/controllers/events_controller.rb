# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize
  before_action :set_event, only: %i[edit show update destroy add_customer
                                     save_customer send_invitations]
  before_action :set_orders, only: %i[show edit]
  before_action :set_volunteers, only: %i[show edit]

  def index
    @events = Event.all
  end

  def show; end

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
      redirect_to events_path, notice: 'Event created.'
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      redirect_to new_event_path
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Event updated.'
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    event_id = params[:id]
    Order.where(event_id: event_id).update_all(event_id: nil)
    @event.destroy
    redirect_to events_path, notice: 'Event deleted.'
  end

  def add_customer
    @orders = Order.order(created_at: :desc)
  end

  def save_customer
    event_id = params[:id]
    order_ids = params[:order_ids]
    Order.where(event_id: event_id).update_all(event_id: nil)

    order_ids&.each do |order_id|
      order = Order.find(order_id)
      order.event_id = event_id
      order.save
    end

    redirect_to add_customer_event_path(@event), notice: 'Event updated.'
  end

  def send_invitations
    orders = Order.where(status: 'ordered')
                  .where("declined_events @> '{?}'", @event.id)
                  .order('id ASC')
                  .limit(@event.order_spaces_available)

    if orders.empty?
      redirect_to events_url, notice: 'There are no spaces left for this event.'
    else
      orders.each do |order|
        CustomerMailer.invitation(@event, order).deliver_now
        order.invited @event
      end

      redirect_to events_url, notice: "Invited #{orders.size} customers."
    end
  end

  def add_volunteer
    event_id = params[:id]
    new_volunteer = EventVolunteer.new(event_id: event_id, user_id: current_user.id)
    if new_volunteer.save
      redirect_to root_url, notice: 'Signed up for event.'
    else
      redirect_to root_url, alert: new_volunteer.errors.full_messages.to_sentence
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :start_time, :end_time, :organizer_id,
                                  :volunteer_spaces, :order_spaces, :name)
  end

  def save_event_volunteers(event, volunteers)
    volunteers&.each do |v|
      EventVolunteer.new(event_id: event.id, user_id: v).save
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_orders
    @orders = Order.where(event_id: @event.id)
  end

  def set_volunteers
    volunteer_ids = EventVolunteer.where(event_id: @event.id).map(&:user_id)
    @volunteers = User.where(id: volunteer_ids)
  end
end
