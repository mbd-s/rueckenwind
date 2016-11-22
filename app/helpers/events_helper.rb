module EventsHelper
  def checked(order_event_id)
    unless order_event_id.nil?
      "checked"
    end
  end

  def disabled(event_id, order_event_id)
    if order_event_id != event_id && !order_event_id.nil?
      "disabled"
    end
  end
end
