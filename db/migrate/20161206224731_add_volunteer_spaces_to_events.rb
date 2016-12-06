class AddVolunteerSpacesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :volunteer_spaces, :integer
  end
end
