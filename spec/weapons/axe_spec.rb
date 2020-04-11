require_relative '../../weapon'
require_relative '../../weapons/axe'

RSpec.describe Axe do
  context 'PERKS' do
    it 'should have attack +4 and defense -1' do
      expect(Axe::PERKS[:attack]).to eq 4
      expect(Axe::PERKS[:defense]).to eq(-1)
    end
  end

  context 'name' do
    it 'should return Axe' do
      expect(Axe.name).to eq 'Axe'
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { attack: 10, defense: 10, critical: 0 } }

    it 'should change attributes value based on perks' do
      perks_attributes = Axe.calculate_perks(attributes)

      expect(perks_attributes[:attack]).to eq 14
      expect(perks_attributes[:defense]).to eq 9
    end
  end
end
