class Invitation < ActiveRecord::Base
  belongs_to :order
  has_many :customers
end
