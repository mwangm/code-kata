require_relative '../spec_helper'

describe 'Roman numeral' do
  context 'when given one single roman symbol' do
    specify { expect(RomanNumeral.new('I').value).to eq(1) }
    specify { expect(RomanNumeral.new('V').value).to eq(5) }
    specify { expect(RomanNumeral.new('X').value).to eq(10) }
    specify { expect(RomanNumeral.new('L').value).to eq(50) }
    specify { expect(RomanNumeral.new('C').value).to eq(100) }
    specify { expect(RomanNumeral.new('D').value).to eq(500) }
    specify { expect(RomanNumeral.new('M').value).to eq(1000) }
  end

  context 'when give multiple roman symbol' do
    context 'When larger values precede smaller values' do
      specify { expect(RomanNumeral.new('VI').value).to eq(6) }
    end

    context 'When smaller values precede larger values' do
      specify { expect(RomanNumeral.new('IV').value).to eq(4) }
    end
  end

  context 'when given invaid roman symbol' do
    specify { expect { RomanNumeral.new('P').value }.to raise_error('invalid roman symbol') }
    specify { expect { RomanNumeral.new('IVPV').value }.to raise_error('invalid roman symbol') }
  end
end
