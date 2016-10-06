class AddPickupLocationToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :pickup_location, :string
  end
end
