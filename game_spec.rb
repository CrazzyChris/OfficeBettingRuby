require '.\game.rb'

RSpec.describe Game do

before :each do
  @testgames = []
  @testgame1 = Game.new("test_home_team_1", "test_away_team_1", "3:1")
  @testgame2 = Game.new("test_home_team_2", "test_away_team_2")
end

it 'should properly print game info when game has ended' do
  expect(@testgame1.printgameinfo).to eq("test_home_team_1 played with test_away_team_1 and the score was 3:1")
end

it 'should properly print game info when game wasn\'t played yet' do
  expect(@testgame2.printgameinfo).to eq("test_home_team_2 will play with test_away_team_2")
end

it 'should properly show games array' do
  @testgame1.addgametoarray(@testgames)
  @testgame2.addgametoarray(@testgames)
  expect(@testgames).to eq(["test_home_team_1 vs. test_away_team_1","test_home_team_2 vs. test_away_team_2"])
end

it 'should properly assign Id to game' do
  testgames = ["test_home_team_1 vs. test_away_team_1","test_home_team_2 vs. test_away_team_2"]
  expect(@testgame1.assignid(testgames)).to eq(1)
  expect(@testgame2.assignid(testgames)).to eq(2)
end

it 'should change games status to premium' do
  @testgame1.setpremiumstatus
  expect(@testgame1.ispremium).to eq(true)
end

it 'should change game status to normal' do
  @testgame1.setnormalstatus
  expect(@testgame1.ispremium).to eq(false)
end

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
