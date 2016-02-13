require_relative '../plateau.rb'

describe Plateau do
  describe 'initialize' do
    it 'returns an object of the class' do
      expect( Plateau.new(1, 3) ).is_a?(Plateau)
    end
  end

  describe 'deploy' do
    it 'should return a deployed robot' do
      plateau = Plateau.new(1, 3)
      expect( plateau.deploy(1, 2, 'N') ).is_a?(Robot)
    end
  end
end