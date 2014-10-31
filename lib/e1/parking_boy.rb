class ParkingBoy
  def initialize(parking_lots)
    @parking_lots = parking_lots
  end

  def park(car)
    @parking_lots.find { |parking_lot| !parking_lot.full? }.park car
  end

  def get_car(ticket)
    car = nil

    @parking_lots.find do |parking_lot|
      car = parking_lot.get_car(ticket)
      !car.nil?
    end

    car
  end
end
