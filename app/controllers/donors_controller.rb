# frozen_string_literal: true

class DonorsController < ApplicationController
  def index
    @donors = Donor.all
  end

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      session[:current_donor_id] = @donor.id
      redirect_to new_donation_path
    else
      flash[:error] = @donor.errors.full_messages.to_sentence
      redirect_to new_donor_path
    end
  end

  private

  def donor_params
    params.require(:donor).permit(:first_name, :last_name, :email, :phone)
  end
end
