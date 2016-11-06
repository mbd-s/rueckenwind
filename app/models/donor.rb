class Donor < ActiveRecord::Base
  belongs_to :pickup
  has_one :donation

  validates :first_name, :last_name, :email, presence: true

end
