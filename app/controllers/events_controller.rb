class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

end
