class AddOrderSpacesToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :order_spaces, :integer
  end
end
