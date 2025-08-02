module TicketingReservation
  def tickets_available
    @tickets_available
  end

  def order_ticket?
    !!try_order_ticket
  end

  def try_order_ticket
    return if tickets_available < 100
    ticket_number = tickets_available
    @tickets_available -= 1
    ticket_number
  end

  def order_message(name)
    ticket_number = try_order_ticket
    if ticket_number
      "#{name}, your purchase was successful, your ticket number is ##{ticket_number}, and the game is played at the #{@stadium} stadium."
    else
      "#{name}, your purchase was unsuccessful, there are not enough tickets available."
    end
  end
end

class TicketSystem
  include TicketingReservation

  def initialize(@tickets_available : UInt32, @stadium : String)
  end
end
