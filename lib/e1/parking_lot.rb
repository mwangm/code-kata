class ParkingLot
  def initialize(capability)
    @cars = {}
    @capability = capability
  end

  def full?
    @cars.size == @capability
  end

  def available_space
    @capability - @cars.size
  end

  def park(car)
    return nil if full?
    ticket = Ticket.new
    @cars[ticket] = car
    ticket
  end

  def get_car(ticket)
    @cars.delete ticket
  end
end
