FactoryGirl.define do
  factory :donor do
    first_name "Kelly"
    last_name "Donor"
    email "kellydonor@fake_email.com"
    created_at Time.now
    updated_at Time.now
  end
end
