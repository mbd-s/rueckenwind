require 'rails_helper'

describe Donor do
  let(:donor) { FactoryGirl.build :donor }

  it { should have_one(:donation) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

end
