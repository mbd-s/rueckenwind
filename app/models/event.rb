class Event < ActiveRecord::Base
  has_many :event_volunteers
  has_many :users, through: :event_volunteers
  has_many :orders
  has_many :customers, through: :orders

  validates :date, :start_time, :end_time, presence: true
  validate :date_cannot_be_in_the_past, :end_time_must_be_after_start_time,
    :volunteer_spaces_cannot_be_less_than_zero

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past.") if
      !date.blank? and date < Date.today
  end

  def end_time_must_be_after_start_time
    errors.add(:end_time, "must be after start time.") if
    !end_time.blank? and !start_time.blank? and end_time <= start_time
  end

  def organizer
    User.find organizer_id
  end

  def volunteer
    User.find volunteer_id
  end

  def volunteer_spaces_cannot_be_less_than_zero
    if volunteer_spaces < 0
      errors[:base] << "You can't have less than zero volunteers."
    end
  end

  def open?
    users.count < volunteer_spaces ? "#{volunteer_spaces - users.count}" : 'Full'
  end

end
