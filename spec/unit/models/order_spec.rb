# frozen_string_literal: true

require 'rails_helper'

describe Order do
  let(:order) { FactoryGirl.build :order }

  it 'has a valid factory' do
    expect(order).to be_valid
  end

  it { should belong_to(:customer) }
  it { should belong_to(:event) }
end
