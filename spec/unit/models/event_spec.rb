require 'rails_helper'

describe Event do
  let(:event) { FactoryGirl.build :event }

  it { should have_many(:event_volunteers) }
  it { should have_many(:users).through(:event_volunteers) }
  it { should have_many(:orders) }
  it { should have_many(:customers).through(:orders) }

end
