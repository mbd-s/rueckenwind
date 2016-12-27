class AddDeclinedEventsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :declined_events, :string, array: true, default: []
  end
end
