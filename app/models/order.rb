class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :event
  validates :customer, presence: true
  validate :bikes_ordered_cannot_be_zero

  accepts_nested_attributes_for :customer

  enum status: [:ordered, :invited, :confirmed, :declined, :completed, :inactive]

  def bikes_ordered_cannot_be_zero
    if mens_bikes == 0 && womens_bikes == 0 && kids_bikes == 0
      errors[:base] << "You need to add at least one bike to your order."
    end
  end

  def total_bikes
    mens_bikes.to_i + womens_bikes.to_i + kids_bikes.to_i
  end

  def confirmed
    self.status = "confirmed"
    save
  end

  def invited event
    self.status = "invited"
    self.event_id = event.id
    save
  end

end
