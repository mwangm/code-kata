require_relative '../spec_helper'

describe 'Parking Boy' do
  context 'given the owner have two parking lot' do
    subject { SmartParkingBoy.new([ParkingLot.new(2), ParkingLot.new(2)]) }

    context 'when it is not full' do
      it 'should park the car to the parking lot which have more carports' do
        subject.park(Car.new)

        expect(subject.park(Car.new)).to be_an_instance_of(Ticket)

        second_parking_lot = subject.instance_variable_get('@parking_lots').last
        expect(second_parking_lot.available_space).to be 1
      end

      it 'should be able to get out car with valid ticket' do
        car = Car.new
        ticket = subject.park(car)

        expect(subject.get_car(ticket)).to be car
      end
    end

    context 'when it is full' do
      before do
        4.times { subject.park(Car.new) }
      end

      it 'should fail to park the car' do
        subject.park(Car.new)

        expect(subject.park(Car.new)).to be nil
      end
    end
  end
end
