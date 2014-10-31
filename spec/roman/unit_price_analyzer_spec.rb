require_relative '../spec_helper'

describe 'Price calculator' do
  context 'Given all the words used as Roman symbol' do
    let(:map) { { glob: 'I', prok: 'V', pish: 'X', tegj: 'L' } }
    subject do
      UnitPriceAnalyzer.new(map)
    end

    context 'when given quantity and price' do
      it 'should could calculator the unit price of metal' do
        sentence = 'pish pish Iron is 3910 Credits'
        expect(subject.analyze_unit_price(sentence)).to eq('Iron' => 195.5)
      end

      it 'should could calculator the unit price of metal' do
        sentence = 'glob glob Silver is 34 Credits'
        expect(subject.analyze_unit_price(sentence)).to eq('Silver' => 17)
      end

      it 'should could calculator the unit price of metal' do
        sentence = 'glob prok Gold is 57800 Credits'
        expect(subject.analyze_unit_price(sentence)).to eq('Gold' => 14_450)
      end

    end
  end
end
