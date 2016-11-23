class AddEmailConfirmedAndConfirmTokenToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :email_confirmed, :boolean, :default => false   
    add_column :customers, :confirm_token, :string
  end
end
