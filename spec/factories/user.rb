FactoryGirl.define do
  factory :user do
    first_name "Bradley"
    last_name "Volunteer"
    email "bradley_user@fake_email.com"
    created_at Time.now
    updated_at Time.now
    role "volunteer"
    experience 1
  end
end
