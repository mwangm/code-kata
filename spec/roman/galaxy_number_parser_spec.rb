require_relative '../spec_helper'
describe 'GalaxyNumberParser' do
  context 'when give a valid sentence' do
    it 'should return correct map' do
      t = GalaxyNumberParser.parse('glob is I')
      expect(t).to eq('glob' => 'I')
    end
  end
end
