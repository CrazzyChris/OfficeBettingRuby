require '.\bet.rb'

RSpec.describe Bet do

  before :each do
    @bet1 = Bet.new('Juventus vs. FC Barcelona','test_user_1',3,1)
  end

  describe 'update_score' do

    it 'should update score when changed' do
      @bet1.update_score(2,1)
      expect(@bet1.home_goals).to eq(2)
      expect(@bet1.away_goals).to eq(1)
    end

    it 'should inform when the score is the same as earlier' do
    end

    it 'should throw error when any of goal predictions has wrong format' do
    end
  end

end
