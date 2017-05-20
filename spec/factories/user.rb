# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    role 'volunteer'
    experience 1
    password { Faker::Internet.password }
  end
end
