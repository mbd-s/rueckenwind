class Donor < ActiveRecord::Base
  belongs_to :pickup
  has_one :donation
end
