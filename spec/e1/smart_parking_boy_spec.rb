require_relative '../spec_helper'

describe 'Parking Boy' do
  context 'given the owner have two parking lot' do
    let(:parking_lot1) { ParkingLot.new(1) }
    let(:parking_lot2) { ParkingLot.new(1) }
    subject { SmartParkingBoy.new([parking_lot1, parking_lot2]) }

    context 'when it is not full' do
      it 'should park the car to the parking lot which have more carports' do
        subject.park(Car.new)

        expect(subject.park(Car.new)).to be_an_instance_of(Ticket)
        expect(parking_lot2.available_space).to be 1
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
