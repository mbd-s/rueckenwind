# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @events = Event.all
  end
end
