class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  scope :active_organizers, -> { where("role = ? AND confirmed_at IS NOT ?", "organizer", nil) }

  def name
    "#{first_name} #{last_name}"
  end

  def to_s
    name
  end
end
