FactoryGirl.define do
  factory :event do
    date { Faker::Date.forward(200) }
    start_time Time.now
    end_time Time.now + 7200
    created_at Time.now
    updated_at Time.now
    volunteer_spaces rand(1..4)
    order_spaces rand(4..8)
  end
end
