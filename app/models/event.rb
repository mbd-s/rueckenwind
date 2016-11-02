class Event < ActiveRecord::Base
  has_many :volunteers
  has_many :customers

  validates :date, :start_time, :end_time, presence: true

end
