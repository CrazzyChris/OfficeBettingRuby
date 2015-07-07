class Game

    attr_reader :home_team, :away_team
    attr_accessor :ispremium, :id, :home_team_goals, :away_team_goals, :hasended

  def initialize(home_team,away_team)
    @home_team = home_team
    @away_team = away_team
    @ispremium = false
    @home_team_goals = 0
    @away_team_goals = 0
    @hasended = false
    @id = 0
  end

  def addgametoarray(games)
    games << "#{@home_team} vs. #{@away_team}"
  end

  def setid(games)
    @id = games.index("#{@home_team} vs. #{@away_team}").to_i + 1
  end

  def setpremiumstatus
    @ispremium = true
  end

  def setnormalstatus
    @ispremium = false
  end

def setscore(home_goals,away_goals, hasended = true)
  if home_goals.is_a? Integer and away_goals.is_a? Integer
    @home_team_goals = home_goals
    @away_team_goals = away_goals
    @hasended = hasended
  else
    raise 'Wrong score format'
  end
end

  def getgameinfo
    if @hasended
      "#{@home_team} played with #{@away_team} and the score was #{@home_team_goals}:#{@away_team_goals}"
    else
      "#{@home_team} will play with #{@away_team}"
    end
  end

end
