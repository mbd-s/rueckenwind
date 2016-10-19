class Volunteer < ActiveRecord::Base
  has_and_belongs_to_many :events

  enum experience: [:basic, :some, :pro]

  validates :first_name, :last_name, :email, presence: true
end
