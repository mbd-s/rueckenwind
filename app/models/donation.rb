# frozen_string_literal: true

class Donation < ActiveRecord::Base
  belongs_to :donor
  validates :pickup_location, presence: true
  validate :bikes_donated_cannot_be_zero

  def hasparts_yn
    parts ? 'Yes' : 'No'
  end

  def bikes_donated_cannot_be_zero
    errors[:base] << 'You need to add at least one bike to your donation.' if bikes < 1
  end
end
