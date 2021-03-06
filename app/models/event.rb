# frozen_string_literal: true

class Event < ActiveRecord::Base
  INVITED = 1
  CONFIRMED = 2

  has_many :event_volunteers, dependent: :delete_all
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
      !date.blank? && date < Date.today
  end

  def end_time_must_be_after_start_time
    errors.add(:end_time, 'must be after start time.') if
    !end_time.blank? && !start_time.blank? && end_time <= start_time
  end

  def organizer
    User.find organizer_id
  end

  def volunteer
    User.find volunteer_id
  end

  def still_open_to_volunteers?
    users.count < volunteer_spaces
  end

  def volunteer_spaces_available
    still_open_to_volunteers? ? (volunteer_spaces - users.count).to_s : 'Full'
  end

  def invited_orders
    orders.where(status: INVITED).count
  end

  def confirmed_orders
    orders.where(status: CONFIRMED).count
  end

  def order_spaces_available
    order_spaces - confirmed_orders
  end
end
