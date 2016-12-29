require 'rails_helper'

describe Donation do
  let(:donation) { FactoryGirl.build :donation }

  it { should belong_to(:donor) }
  it { should validate_presence_of(:pickup_location) }

end
