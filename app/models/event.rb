class Event < ActiveRecord::Base
  has_many :volunteers
  has_many :customers
end
