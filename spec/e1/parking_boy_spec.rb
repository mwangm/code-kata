require_relative '../spec_helper'

describe 'Parking Boy' do
  context 'given the owner have two parking lot' do
    let(:parking_lot1) { ParkingLot.new(1) }
    let(:parking_lot2) { ParkingLot.new(1) }

    subject { ParkingBoy.new([parking_lot1, parking_lot2]) }

    it 'should park the car to parking lot success when it is not full' do
      subject.park(Car.new)

      first_parking_lot = subject.instance_variable_get('@parking_lots').last
      expect(first_parking_lot.available_space).to be 1
      expect(subject.park(Car.new)).to be_an_instance_of(Ticket)
    end

    it 'should be able to get out car with valid ticket' do
      car = Car.new
      ticket = subject.park(car)

      expect(subject.get_car(ticket)).to be car
    end
  end
end
