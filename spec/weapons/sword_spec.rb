require_relative '../../weapon'
require_relative '../../weapons/sword'

RSpec.describe Sword do
  context 'PERKS' do
    it 'should have attack +2 and defense +2' do
      expect(Sword::PERKS[:attack]).to eq 2
      expect(Sword::PERKS[:defense]).to eq 2
    end
  end

  context 'name' do
    it 'should return Sword' do
      expect(Sword.name).to eq 'Sword'
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { attack: 10, defense: 10, critical: 0 } }

    it 'should change attributes value based on perks' do
      perks_attributes = Sword.calculate_perks(attributes)

      expect(perks_attributes[:attack]).to eq 12
      expect(perks_attributes[:defense]).to eq 12
    end
  end
end
