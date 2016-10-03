class AddCustomerToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :customer, index: true, foreign_key: true
  end
end
