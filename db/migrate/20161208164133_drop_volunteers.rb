class DropVolunteers < ActiveRecord::Migration
  def change
    drop_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :role
      t.string :phone
      t.integer :experience

      t.timestamps null: false
    end
  end
end
