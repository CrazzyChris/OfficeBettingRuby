require 'pg'

conn = PGconn.connect("localhost",5432,"","","test","postgres","phoenix")

res = conn.exec("select bets.id as \"bet id\",users.name as name, bets.hometeamgoals as \"predicted home goals\", bets.awayteamgoals as \"predicted away goals\", games.hometeamgoals as \"correct home goals\", games.awayteamgoals as \"correct away goals\" from Bets,Games,Users where bets.gameid = games.id and bets.userid = users.id;")

res.each do |row|
  bet_id = row['bet id']
  user = row['name']
  predicted_home_goals = row['predicted home goals']
  predicted_away_goals = row['predicted away goals']
  real_home_goals = row['correct home goals']
  real_away_goals = row['correct away goals']

  if predicted_home_goals == real_home_goals and predicted_away_goals == real_away_goals
    conn.exec("update bets set points = 3 where id = #{bet_id} ")
    p "#{user} is awesome"
  elsif (predicted_home_goals > predicted_away_goals and real_home_goals > real_away_goals) or (predicted_home_goals < predicted_away_goals and real_home_goals < real_away_goals)
    p "#{user} is good"
    conn.exec("update bets set points = 1 where id = #{bet_id} ")
  else
    p "#{user} is stupid"
    conn.exec("update bets set points = 0 where id = #{bet_id} ")
  end

end
