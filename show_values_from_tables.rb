require 'pg'

conn = PGconn.connect("localhost",5432,"","","test","postgres","phoenix")

#show values from users table
res = conn.exec("select * from Users")

res.each do |row|

  username = row['displayname']
  points = row['points']

  p "User #{username} has #{points} points."

end

#show values from games table

res = conn.exec("select * from Games")

res.each do |row|

  home_team = row['hometeam']
  away_team = row['awayteam']
  home_team_goals = row['hometeamgoals']
  away_team_goals = row['awayteamgoals']

  p "#{home_team} vs #{away_team} #{home_team_goals}:#{away_team_goals}"

end

#show values from bets table

res = conn.exec("select * from Bets")

res.each do |row|

  user = row['userid']
  game = row['gameid']
  home_team_goals = row['hometeamgoals']
  away_team_goals = row['awayteamgoals']

  p "user #{user} predicts that game #{game} will end with score #{home_team_goals}:#{away_team_goals}"

end
