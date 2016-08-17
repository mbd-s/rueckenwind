class Customer < ActiveRecord::Base
  has_many :orders
  has_many :invitations
  has_and_belongs_to_many :events
end
