class Event < ActiveRecord::Base
  has_many :volunteers
  has_many :customers

  validates :date, :start_time, :end_time, presence: true
  validate :date_cannot_be_in_the_past, :end_time_must_be_after_start_time
  
  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past.") if
      !date.blank? and date < Date.today
  end

  def end_time_must_be_after_start_time
    errors.add(:end_time, "must be after start time.") if
    !end_time.blank? and !start_time.blank? and end_time < start_time
  end
end
