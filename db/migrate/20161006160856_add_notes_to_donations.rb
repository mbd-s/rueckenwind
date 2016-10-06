class AddNotesToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :notes, :string
  end
end
