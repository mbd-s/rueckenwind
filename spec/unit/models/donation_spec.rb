require 'rails_helper'

describe Donation do
  let(:donation) { FactoryGirl.build :donation }

  it { should belong_to(:donor) }

end
