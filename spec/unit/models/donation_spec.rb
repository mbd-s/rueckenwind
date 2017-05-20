# frozen_string_literal: true

require 'rails_helper'

describe Donation do
  let(:donation) { FactoryGirl.build :donation }

  it 'has a valid factory' do
    expect(donation).to be_valid
  end

  it { should belong_to(:donor) }
  it { should validate_presence_of(:pickup_location) }
end
