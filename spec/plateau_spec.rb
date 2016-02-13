require_relative '../plateau.rb'

describe Plateau do
  describe 'initialize' do
    it 'returns an object of the class' do
      expect( Plateau.new(1, 3) ).is_a?(Plateau)
    end

    it 'should not let the user to create an object when top-left is < 0' do
      expect { Plateau.new(-1, 3) }
        .to raise_error('Please enter top_left coordinate as >= 0 and and top_right as >= 1')
    end

    it 'should not let the user to create an object when top-right is < 1' do
      expect { Plateau.new(-1, 3) }
        .to raise_error('Please enter top_left coordinate as >= 0 and and top_right as >= 1')
    end
  end

  describe 'deploy' do
    it 'should return a deployed robot' do
      plateau = Plateau.new(1, 3)
      expect( plateau.deploy(1, 2, 'N') ).is_a?(Robot)
    end

    context 'when user tries to position the robot outside of the plateau' do
      let(:plateau) { Plateau.new(1, 3) }

      it 'should fail when x < 0' do
        expect { plateau.deploy(-1, 2, 'N') }
          .to raise_error('Positioning should be within the scope of the rectangle represented by (0, 0) and (1, 3) coordinates')
      end

      it 'should fail when x > 1' do
        expect { plateau.deploy(2, 2, 'N') }
          .to raise_error('Positioning should be within the scope of the rectangle represented by (0, 0) and (1, 3) coordinates')
      end

      it 'should fail when y < 0' do
        expect { plateau.deploy(1, -1, 'N') }
          .to raise_error('Positioning should be within the scope of the rectangle represented by (0, 0) and (1, 3) coordinates')
      end

      it 'should fail when y > 3' do
        expect { plateau.deploy(1, 4, 'N') }
          .to raise_error('Positioning should be within the scope of the rectangle represented by (0, 0) and (1, 3) coordinates')
      end
    end
  end
end
