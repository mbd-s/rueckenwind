# frozen_string_literal: true

FactoryGirl.define do
  factory :event do
    date { Faker::Date.forward(200) }
    start_time Time.now
    end_time Time.now + 7200
    volunteer_spaces 1
    order_spaces 1
  end
end
