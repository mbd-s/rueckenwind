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

  describe '#order_spaces_available' do
    it 'calculates the number of order spaces available' do
      event = create :event, order_spaces: 3

      allow(event).to receive(:confirmed_orders).and_return(1)

      expect(event.order_spaces_available).to eq 2
    end
  end

  describe '#confirmed_orders' do
    it 'returns only orders that have been confirmed' do
      event = create :event

      create_list :order, 2, event_id: event.id, status: Event::CONFIRMED
      create :order, event_id: event.id, status: Event::INVITED

      expect(event.confirmed_orders).to eq 2
    end
  end

  describe '#invited_orders' do
    it 'returns only orders that have been invited' do
      event = create :event

      create_list :order, 2, event_id: event.id, status: Event::INVITED
      create :order, event_id: event.id, status: Event::CONFIRMED

      expect(event.invited_orders).to eq 2
    end
  end

end
