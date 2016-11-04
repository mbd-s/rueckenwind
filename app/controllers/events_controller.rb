class EventsController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event saved."
      redirect_to events_path
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
    render :edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Event updated."
      redirect_to events_path
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event deleted."
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :start_time, :end_time)
  end

end
