class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.date :date_sent
      t.boolean :sent

      t.timestamps null: false
    end
  end
end
