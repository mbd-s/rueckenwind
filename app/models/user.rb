# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :event_volunteers
  has_many :events, through: :event_volunteers
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  scope :admin_and_organizers,
        -> { where('role IN (?) AND confirmed_at IS NOT ?', %w[admin organizer], nil) }
  scope :volunteers,
        -> { where('role = ? AND confirmed_at IS NOT ?', 'volunteer', nil) }

  enum experience: %i[basic intermediate pro]

  def name
    "#{first_name} #{last_name}"
  end

  def display_experience
    "#{name} (#{experience})"
  end

  def to_s
    name
  end

  def signed_up_for?(event)
    EventVolunteer.exists?(event_id: event.id, user_id: id)
  end
end
