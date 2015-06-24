class Game

  def initialize(home_team,away_team,score = nil,ispremium = false, id=0)
    @home_team = home_team
    @away_team = away_team
    @score = score
    @ispremium = ispremium
  end

  def addgametoarray(games)
    @games = games
    @games << "#{@home_team} vs. #{@away_team}"
  end

  def assignid(games)
    @id = games.index("#{@home_team} vs. #{@away_team}").to_i + 1
  end

  def hasended?
    @score ? true : false
  end

  def printgameinfo
    if hasended?
      "#{@home_team} played with #{@away_team} and the score was #{@score}"
    else
      "#{@home_team} will play with #{@away_team}"
    end
  end

end

testgames = Array.new
testgame = Game.new("Juventus","Barcelona","3:1")
testgame2 = Game.new("Bayern","Real Madryt")
testgame.assignid(testgames)
testgame2.assignid(testgames)
testgame.printgameinfo

#testgame.home_team
