class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :events, through: :orders

  validates :first_name, :last_name, :email, presence: true

  before_create :generate_token

  def name
    "#{first_name} #{last_name}"
  end

  def to_s
    name
  end

  def generate_token
    self.confirm_token = SecureRandom.hex(20)
  end
end
