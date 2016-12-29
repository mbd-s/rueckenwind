FactoryGirl.define do
  factory :event do
    date 0
    start_time Time.now + 100
    end_time Time.now + 200
    created_at Time.now
    updated_at Time.now
    volunteer_spaces 4
    order_spaces 8
    organizer_id 1
  end
end
