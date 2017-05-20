# frozen_string_literal: true

class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.donor_id = session[:current_donor_id]
    if @donation.save
      redirect_to root_path, notice: 'Donation successfully submitted.'
    else
      flash[:error] = @donation.errors.full_messages.to_sentence
      redirect_to new_donation_path
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
