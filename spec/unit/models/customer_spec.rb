# frozen_string_literal: true

require 'rails_helper'

describe Customer do
  let(:customer) { FactoryGirl.build :customer }

  it 'has a valid factory' do
    expect(customer).to be_valid
  end

  it { should have_many :orders }
  it { should have_many :events }
  it { should have_many(:events).through(:orders) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  xit 'should remove related orders' do
    expect { customer.destroy }.to change { Order.count }.by(-1)
  end
end
