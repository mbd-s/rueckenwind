FactoryGirl.define do
  factory :event do
    date { Faker::Date.forward(200) }
    start_time Time.now
    end_time Time.now + 7200
  end
end
