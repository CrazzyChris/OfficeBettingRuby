class Game

    attr_reader :home_team, :away_team
    attr_accessor :score, :ispremium, :id

  def initialize(home_team,away_team,score = nil)
    @home_team = home_team
    @away_team = away_team
    @score = score
    @ispremium = false
    @id = 0
  end

  def addgametoarray(games)
    games << "#{@home_team} vs. #{@away_team}"
  end

  def setid(games)
    @id = games.index("#{@home_team} vs. #{@away_team}").to_i + 1
  end

  def hasended?
    @score ? true : false
  end

  def setpremiumstatus
    @ispremium = true
  end

  def setnormalstatus
    @ispremium = false
  end

def setscore(score)
  score.strip! =~ /\d+:\d*/ ? @score = score : @score=nil
end

  def getgameinfo
    if hasended?
      "#{@home_team} played with #{@away_team} and the score was #{@score}"
    else
      "#{@home_team} will play with #{@away_team}"
    end
  end

end
