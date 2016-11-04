class DropOrganizersTable < ActiveRecord::Migration
  def up
    drop_table :organizers
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
