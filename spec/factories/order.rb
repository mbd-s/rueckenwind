# frozen_string_literal: true

FactoryGirl.define do
  factory :order do
    status 0
    mens_bikes 1
    womens_bikes 1
    kids_bikes 2
    notes 'thanks'
    customer
  end
end
