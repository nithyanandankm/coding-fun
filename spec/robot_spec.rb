require_relative '../robot.rb'

describe Robot do
  describe 'initialize' do
    it 'returns an object of the class' do
      expect( Robot.new(1, 2, 'N') ).is_a?(Robot)
    end
  end

  describe 'move' do
    context 'basic check' do
      let (:robot) { Robot.new(1, 2, 'N') }

      it 'should return false for invalid command' do
        expect(robot.move('B')).to be_falsey
      end

      it 'should invoke walk for \'M\' command' do
        expect(robot).to receive(:walk)
        robot.move('M')
      end

      %w(L R).each do |cmd|
        it "should invoke turn for '#{cmd}' command" do
          expect(robot).to receive(:turn)
          robot.move(cmd)
        end
      end
    end

    context 'when robot it facing North direction' do
      let (:robot) { Robot.new(1, 2, 'N') }

      it 'move(R) should change its direction to West' do
        robot.move('R')
        expect(robot.position).to eq 'W'
      end

      it 'move(L) should change its direction to East' do
        robot.move('L')
        expect(robot.position).to eq 'E'
      end

      it 'move(M) should increment the y coordinate' do
        robot.move('M')
        expect(robot.y).to eq 3
      end
    end

    context 'when robot it facing West direction' do
      let (:robot) { Robot.new(1, 2, 'W') }

      it 'move(R) should change its direction to South' do
        robot.move('R')
        expect(robot.position).to eq 'S'
      end

      it 'move(L) should change its direction to North' do
        robot.move('L')
        expect(robot.position).to eq 'N'
      end

      it 'move(M) should increment the x coordinate' do
        robot.move('M')
        expect(robot.x).to eq 2
      end
    end

    context 'when robot it facing South direction' do
      let (:robot) { Robot.new(1, 2, 'S') }

      it 'move(R) should change its direction to East' do
        robot.move('R')
        expect(robot.position).to eq 'E'
      end

      it 'move(L) should change its direction to West' do
        robot.move('L')
        expect(robot.position).to eq 'W'
      end

      it 'move(M) should decrement the y coordinate' do
        robot.move('M')
        expect(robot.y).to eq 1
      end
    end

    context 'when robot it facing East direction' do
      let (:robot) { Robot.new(1, 2, 'E') }

      it 'move(R) should change its direction to North' do
        robot.move('R')
        expect(robot.position).to eq 'N'
      end

      it 'move(L) should change its direction to South' do
        robot.move('L')
        expect(robot.position).to eq 'S'
      end

      it 'move(M) should decrement the x coordinate' do
        robot.move('M')
        expect(robot.x).to eq 0
      end
    end
  end

  describe 'current_position' do
    it 'should return the current position of the robot' do
      robot = Robot.new(4, 3, 'N')
      expect(robot.current_position).to eq '4 3 N'
    end
  end
end