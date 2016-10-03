Order.destroy_all
orders = Order.create([{ mens_bikes: 0, womens_bikes: 2, kids_bikes: 1, invitation_sent: false, confirmed: false, notes: 'What time does the workshop start?'},
  { mens_bikes: 1, womens_bikes: 0, kids_bikes: 0, invitation_sent: true, confirmed: true, notes: '' }])
puts "Created #{Order.count} orders."
