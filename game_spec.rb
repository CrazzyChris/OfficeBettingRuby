require '.\game.rb'

RSpec.describe Game do

before :each do
  @testgames = []
  @testgame1 = Game.new("test_team_1", "test_team_2")
  @testgame1.setscore(3,1)
  @testgame2 = Game.new("test_team_3", "test_team_4")
end

describe '.getgameinfo' do
  it 'should properly provide game info when game has ended' do
    expect(@testgame1.getgameinfo).to eq("test_team_1 played with test_team_2 and the score was 3:1")
  end

  it 'should properly provide game info when game was not played yet' do
    expect(@testgame2.getgameinfo).to eq("test_team_3 will play with test_team_4")
  end

end

describe '.addgametoarray' do

  it 'should properly add games to array' do
    @testgame1.addgametoarray(@testgames)
    @testgame2.addgametoarray(@testgames)
    expect(@testgames).to eq(["test_team_1 vs. test_team_2","test_team_3 vs. test_team_4"])
  end

end

describe '.setid' do
  it 'should properly assign Id to game' do
    testgames = ["test_team_1 vs. test_team_2","test_team_3 vs. test_team_4"]
    expect(@testgame1.setid(testgames)).to eq(1)
    expect(@testgame2.setid(testgames)).to eq(2)
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

describe '.setscore' do
  it 'should assign score to game' do
    @testgame2.setscore(2,1)
    expect(@testgame2.home_team_goals).to eq(2)
    expect(@testgame2.away_team_goals).to eq(1)
  end

  it 'should override score when changed' do
    @testgame1.setscore(1,1)
    expect(@testgame1.home_team_goals).to eq(1)
    expect(@testgame1.away_team_goals).to eq(1)
  end

  it 'should reset score if game did not ended yet' do
    @testgame1.setscore(0,0,false)
    expect(@testgame1.home_team_goals).to eq(0)
    expect(@testgame1.away_team_goals).to eq(0)
    expect(@testgame1.hasended).to eq(false)
  end

  it 'should recognize not valid score and assign nil' do
    @testgame1.setscore('a','a')
    expect(@testgame1.home_team_goals).to eq(0)
    expect(@testgame1.away_team_goals).to eq(0)
    expect(@testgame1.hasended).to eq(false)
  end
end

end
