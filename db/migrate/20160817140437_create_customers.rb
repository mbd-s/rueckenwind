class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :facebook
      t.boolean :has_donated
      t.boolean :signed_up
      t.boolean :wants_to_be_mechanic

      t.timestamps null: false
    end
  end
end
