class AddBikesToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :bikes, :integer, :default => 0
  end
end
