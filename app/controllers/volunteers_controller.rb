class VolunteersController < ApplicationController
  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      flash[:notice] = "Success!"
      redirect_to root_path
    else
      flash[:error] = @volunteer.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :email, :phone, :experience)
  end
end
