require_relative '../character'

RSpec.describe Character do
  context 'initialize' do
    it 'should raise error can not initialize an abstact class' do
      expect { Character.new }
        .to raise_error('Cannot initialize an abstract Character class')
    end
  end
end
