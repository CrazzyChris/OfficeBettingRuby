require '.\game.rb'

RSpec.describe Game do

before :each do
  @testgames = []
end

before :all do
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

end
