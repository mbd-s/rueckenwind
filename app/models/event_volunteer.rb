# frozen_string_literal: true

class EventVolunteer < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
