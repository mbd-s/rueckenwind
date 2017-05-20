# frozen_string_literal: true

module EventsHelper
  def checked(order_event_id)
    'checked' unless order_event_id.nil?
  end

  def disabled(event_id, order_event_id)
    'disabled' if order_event_id != event_id && !order_event_id.nil?
  end
end
