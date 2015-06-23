class Game

  def initialize(home_team,away_team,score = nil,ispremium = false)
    @home_team = home_team
    @away_team = away_team
    @score = score
    @ispremium = ispremium
  end

  def printgameinfo
    if @score
      p "#{@home_team} played with #{@away_team} and the score was #{@score}"
    else
      p "#{@home_team} will play with #{@away_team}"
    end
  end

end

testgame = Game.new("Juventus","Barcelona","3:1")
testgame.printgameinfo
testgame.home_team
