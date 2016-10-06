class DonationsController < ApplicationController

  def index
    @donation = Donation.all
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.donor_id = session[:current_donor_id]
    if @donation.save
      flash[:success] = "Donation successfully submitted."
      redirect_to root_path
    else
      flash[:error] = @donation.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    render :show
  end

  private

  def donation_params
    params.require(:donation).permit(:pickup_location, :bikes, :parts, :notes)
  end

end
