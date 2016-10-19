class AddExperienceToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :experience, :integer
  end
end
