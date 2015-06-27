require '.\game.rb'

RSpec.describe Game do

before :each do
  @testgames = []
  @testgame1 = Game.new("test_team_1", "test_team_2", "3:1")
  @testgame2 = Game.new("test_team_3", "test_team_4")
end

describe '.printgameinfo' do
  it 'should properly print game info when game has ended' do
    expect(@testgame1.printgameinfo).to eq("test_team_1 played with test_team_2 and the score was 3:1")
  end

  it 'should properly print game info when game was not played yet' do
    expect(@testgame2.printgameinfo).to eq("test_team_3 will play with test_team_4")
  end

end

describe '.addgametoarray' do

  it 'should properly add games to array' do
    @testgame1.addgametoarray(@testgames)
    @testgame2.addgametoarray(@testgames)
    expect(@testgames).to eq(["test_team_1 vs. test_team_2","test_team_3 vs. test_team_4"])
  end

end

describe '.assignid' do
  it 'should properly assign Id to game' do
    testgames = ["test_team_1 vs. test_team_2","test_team_3 vs. test_team_4"]
    expect(@testgame1.assignid(testgames)).to eq(1)
    expect(@testgame2.assignid(testgames)).to eq(2)
  end

end

describe '.changestatus' do
  it 'should change games status to premium' do
    @testgame1.setpremiumstatus
    expect(@testgame1.ispremium).to eq(true)
  end

  it 'should change game status to normal' do
    @testgame1.setnormalstatus
    expect(@testgame1.ispremium).to eq(false)
  end

end

describe '.assignscore' do
  it 'should assign score to game' do
    @testgame2.assignscore(' 2:1')
    expect(@testgame2.score).to eq('2:1')
  end

  it 'should override score when changed' do
    @testgame1.assignscore('1:1 ')
    expect(@testgame1.score).to eq('1:1')
  end

  it 'should reset score if game did not ended yet' do
    @testgame1.assignscore(' ')
    expect(@testgame1.score).to eq(nil)
  end

end

end
