require 'rails_helper'

describe Order do
  let(:order) { FactoryGirl.build :order }

  it { should belong_to(:customer) }
  it { should belong_to(:event) }

end
