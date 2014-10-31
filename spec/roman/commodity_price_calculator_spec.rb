describe 'commodity price calculator' do
  context '' do
    let(:number_mapper) { { glob: 'I', prok: 'V', pish: 'X', tegj: 'L' } }
    let(:commodity_price) { { Silver: 17, Gold: 14_450, Iron: 195.5 } }
    subject { CommodityPriceCalculator.new number_mapper, commodity_price }

    it 'should could calculator the price of given order' do
      expect(subject.exec('how many Credits is glob prok Silver ?')).to eq('glob prok Silver is 68 Credits')
    end
  end
end
