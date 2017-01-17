require 'rails_helper'

describe Event do
  let(:event) { FactoryGirl.build :event }

  it 'has a valid factory' do
    expect(event).to be_valid
  end

  it { should have_many :event_volunteers }
  it { should have_many :orders }

  it { should have_many(:users).through(:event_volunteers) }
  it { should have_many(:customers).through(:orders) }

  it { should validate_presence_of :date }
  it { should validate_presence_of :start_time }
  it { should validate_presence_of :end_time }

  it { should validate_numericality_of :volunteer_spaces }
  it { should validate_numericality_of :order_spaces }

end
