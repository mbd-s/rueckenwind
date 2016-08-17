class CreatePickups < ActiveRecord::Migration
  def change
    create_table :pickups do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
