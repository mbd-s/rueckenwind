class Order < ActiveRecord::Base
  belongs_to :customer
  validate :has_a_bike

  def has_a_bike
    if [mens_bikes, womens_bikes, kids_bikes].reject(&:blank?).size == 0
      errors[:base] << ('You need to add at least one bike to your order.')
    end
  end

end
