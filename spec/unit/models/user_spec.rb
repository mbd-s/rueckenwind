require 'rails_helper'

describe User do
  let(:user) { FactoryGirl.build :user }

  it { should have_many :events}
  it { should have_many(:events).through(:event_volunteers) }

end
