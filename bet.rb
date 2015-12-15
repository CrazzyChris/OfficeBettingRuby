class Bet

attr_reader :user, :game
attr_accessor :home_goals, :away_goals, :points, :exact_score

def initialize(user,game,home_goals,away_goals)
  @game = game
  @user = user
  @home_goals = home_goals
  @away_goals = away_goals
  @points = 0
  @exact_score = false
end

def update_score(new_home_goals,new_away_goals)
  @home_goals = new_home_goals
  @away_goals = new_away_goals
end

def place_bet(gameid,predicted_home_goals,predicted_away_goals)
end

end
