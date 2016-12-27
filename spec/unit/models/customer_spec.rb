require 'rails_helper'

describe Customer do

  it { should have_many :orders}
  it { should have_many :events}
  it { should have_many(:events).through(:orders) }

  expect { customer.destroy }.to change { Order.count }.by(-1)
end
