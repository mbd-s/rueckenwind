# frozen_string_literal: true

FactoryGirl.define do
  factory :donor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end
end
