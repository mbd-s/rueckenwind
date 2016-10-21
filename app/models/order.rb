class Order < ActiveRecord::Base
  belongs_to :customer
  validates :customer, presence: true
  validate :bikes_ordered_cannot_be_zero

  accepts_nested_attributes_for :customer

  def bikes_ordered_cannot_be_zero
    if mens_bikes == 0 && womens_bikes == 0 && kids_bikes == 0
      errors[:base] << "You need to add at least one bike to your order."
    end
  end

  def confirmed_yn
    confirmed ? 'Yes' : 'No'
  end

  def invited_yn
    invitation_sent ? 'Yes' : 'No'
  end

  def total_bikes
    mens_bikes.to_i + womens_bikes.to_i + kids_bikes.to_i
  end

end
