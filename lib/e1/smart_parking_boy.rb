class SmartParkingBoy < ParkingBoy
  def park(car)
    @parking_lots.max_by(&:available_space).tap do |parking_lot|
      parking_lot.park car
    end
  end
end
