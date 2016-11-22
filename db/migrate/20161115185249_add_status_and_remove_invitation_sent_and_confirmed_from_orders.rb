class AddStatusAndRemoveInvitationSentAndConfirmedFromOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    remove_column :orders, :invitation_sent, :boolean
    remove_column :orders, :confirmed, :boolean
  end
end
