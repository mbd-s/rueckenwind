class Order < ActiveRecord::Base
  belongs_to :customer
  validates :customer, presence: true
  validate :bikes_ordered_cannot_be_zero

  def bikes_ordered_cannot_be_zero
    if mens_bikes == 0 && womens_bikes == 0 && kids_bikes == 0
      errors[:base] << "You need to add at least one bike to your order."
    end
  end

end
