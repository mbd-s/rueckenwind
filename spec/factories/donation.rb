FactoryGirl.define do
  factory :donation do
    pickup_location { Faker::Address.street_address }
    bikes 3
    parts true
    notes { Faker::Lorem.sentence }
  end
end
