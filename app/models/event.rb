class Event < ActiveRecord::Base
  has_many :event_volunteers
  has_many :users, through: :event_volunteers
  has_many :orders
  has_many :customers, through: :orders

  validates :date, :start_time, :end_time, presence: true
  validate :end_time_must_be_after_start_time
  validate :date_cannot_be_in_the_past, on: :create

  validates_numericality_of :volunteer_spaces, greater_than: 0
  validates_numericality_of :order_spaces, greater_than: 0

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

  def open?
    users.count < volunteer_spaces
  end

  def spaces_available
    open? ? "#{volunteer_spaces - users.count}" : 'Full'
  end

  def order_spaces_available
    confirmed_orders = Order.where(status: 'confirmed', event_id: id)
    order_spaces - confirmed_orders.count
  end
end
