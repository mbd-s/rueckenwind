User.destroy_all

User.create(
  first_name: "Seed",
  last_name: "Admin",
  email: "a@a",
  password: "111111",
  reset_password_token: nil,
  reset_password_sent_at: nil,
  remember_created_at: nil,
  sign_in_count: 3,
  current_sign_in_at: nil,
  last_sign_in_at: nil,
  current_sign_in_ip: nil,
  last_sign_in_ip: nil,
  confirmation_token: "3pdxVjxo8tdZHGTCtwsC",
  confirmed_at: nil,
  confirmation_sent_at: nil,
  unconfirmed_email: nil,
  created_at: Time.now,
  updated_at: Time.now,
  role: "admin"
)
puts "Just created #{User.count} users"
