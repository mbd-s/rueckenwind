class AddPartsToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :parts, :boolean, :default => false
  end
end
