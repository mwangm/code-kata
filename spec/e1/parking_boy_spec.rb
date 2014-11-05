require_relative '../spec_helper'

describe 'Parking Boy' do
  context 'given the owner have two parking lot' do
    let(:parking_lot1) { ParkingLot.new(1) }
    let(:parking_lot2) { ParkingLot.new(1) }

    subject { ParkingBoy.new([parking_lot1, parking_lot2]) }

    it 'should park the car to parking lot success when it is not full' do
      subject.park(Car.new)

      expect(parking_lot1.available_space).to be 1
      expect(subject.park(Car.new)).to be_an_instance_of(Ticket)
    end

    it 'should be able to get out car with valid ticket' do
      car = Car.new
      ticket = subject.park(car)

      expect(subject.get_car(ticket)).to be car
    end
  end
end
