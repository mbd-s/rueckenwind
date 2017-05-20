# frozen_string_literal: true

class Pickup < ActiveRecord::Base
  has_many :donors
end
