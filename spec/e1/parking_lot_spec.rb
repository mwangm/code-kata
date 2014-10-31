require_relative '../spec_helper'

describe 'Parking lot' do
  subject { ParkingLot.new(2) }

  context 'when park a car' do
    it 'should return a ticket if success' do
      expect(subject.park(Car.new)).to be_an_instance_of(Ticket)
    end

    it 'should return nil if full' do
      2.times { subject.park(Car.new) }

      expect(subject.park(Car.new)).to be(nil)
    end
  end

  context 'get a parking car back' do
    it 'should success by the given valid ticket' do
      car = Car.new
      ticket = subject.park(car)

      expect(subject.get_car(ticket)).to be(car)
    end
  end

end
