class VolunteersController < ApplicationController
  def index
    @volunteer = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
  end
end
