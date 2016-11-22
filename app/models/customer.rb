class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :invitations
  has_many :events, through: :orders

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def to_s
    name
  end
  
end
