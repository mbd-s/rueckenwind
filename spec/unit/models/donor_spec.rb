# frozen_string_literal: true

require 'rails_helper'

describe Donor do
  let(:donor) { FactoryGirl.build :donor }

  it 'has a valid factory' do
    expect(donor).to be_valid
  end

  it { should have_one(:donation) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
end
