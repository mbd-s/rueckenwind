# frozen_string_literal: true

FactoryGirl.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    facebook 'facebook.com/jack_customer'
    has_donated false
    signed_up false
    wants_to_be_mechanic false
    email_confirmed true
    confirm_token 'oajsodfj5'
  end
end
