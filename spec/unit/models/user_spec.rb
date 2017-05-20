# frozen_string_literal: true

require 'rails_helper'

describe User do
  let(:user) { FactoryGirl.build :user }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it { should have_many :events }
  it { should have_many(:events).through(:event_volunteers) }
end
