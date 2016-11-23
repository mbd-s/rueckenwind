User.destroy_all

a = User.create(
  first_name: "Seed",
  last_name: "Admin",
  email: "a@a",
  password: "111111",
  reset_password_token: nil,
  reset_password_sent_at: nil,
  remember_created_at: nil,
  sign_in_count: 3,
  current_sign_in_at: "2016-11-04 18:21:33",
  last_sign_in_at: "2016-11-04 18:20:30",
  current_sign_in_ip: nil,
  last_sign_in_ip: nil,
  confirmation_token: "3pdxVjxo8tdZHGTCtwsC",
  confirmed_at: "2016-11-04 18:13:59",
  confirmation_sent_at: "2016-11-04 18:13:51",
  unconfirmed_email: nil,
  created_at: "2016-11-04 18:13:51",
  updated_at: "2016-11-04 18:21:33",
  role: "admin"
)
puts "Just created #{User.count} users"
