class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :invitations
  has_and_belongs_to_many :events

  validates :first_name, :last_name, :email, presence: true
end
