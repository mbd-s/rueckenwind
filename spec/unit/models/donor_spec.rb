require 'rails_helper'

describe Donor do
  let(:donor) { FactoryGirl.build :donor }

  it { should have_one(:donation) }

end
