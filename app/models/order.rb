# frozen_string_literal: true

class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :event
  validates :customer, presence: true
  validate :bikes_ordered_cannot_be_zero

  accepts_nested_attributes_for :customer

  enum status: %i[ordered invited confirmed canceled completed inactive]

  def bikes_ordered_cannot_be_zero
    if mens_bikes == 0 && womens_bikes == 0 && kids_bikes == 0
      errors[:base] << 'You need to add at least one bike to your order.'
    end
  end

  def total_bikes
    mens_bikes.to_i + womens_bikes.to_i + kids_bikes.to_i
  end

  def invited(event)
    self.status = 'invited'
    self.event_id = event.id
    save
  end

  def confirmed
    self.status = 'confirmed'
    save
  end

  def declined
    self.status = 'ordered'
    declined_events.push(event_id)
    self.event_id = nil
    save
  end

  def canceled
    self.status = 'canceled'
    self.event_id = nil
    save
  end

  def self.to_csv
    attributes = %w[order_date name email phone total_bikes
                    mens_bikes womens_bikes kids_bikes status notes]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |order|
        csv << [order.created_at, order.customer, order.customer.email,
                order.customer.phone, order.total_bikes, order.mens_bikes,
                order.womens_bikes, order.kids_bikes, order.status, order.notes]
      end
    end
  end
end
