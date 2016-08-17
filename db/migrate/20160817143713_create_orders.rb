class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :mens_bikes
      t.integer :womens_bikes
      t.integer :kids_bikes
      t.boolean :invitation_sent
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
