require 'pg'

conn = PGconn.connect("localhost",5432,"","","test","postgres","phoenix")

#Create and show values from User Table
conn.exec("DROP TABLE IF EXISTS Users")
conn.exec("CREATE TABLE Users(Id Integer PRIMARY KEY, Name VARCHAR(20),Points INT DEFAULT 0)")
conn.exec("INSERT INTO Users VALUES(1,'ONC46985')")
conn.exec("INSERT INTO Users VALUES(2,'ZDE480907')")

res = conn.exec("select * from Users")

res.each do |row|

  username = row['name']
  points = row['points']

  p "User #{username} has #{points} points."

end

#Create and show values from Games Table
conn.exec("DROP TABLE IF EXISTS Games")
conn.exec("CREATE TABLE Games(Id Integer PRIMARY KEY, HomeTeam VARCHAR(20), AwayTeam VARCHAR(20), HomeTeamGoals INT DEFAULT null, AwayTeamGoals INT DEFAULT null, ispremium BOOLEAN DEFAULT FALSE)")
conn.exec("INSERT INTO Games VALUES(1,'PSG','Malmo',2,0,false)")
conn.exec("INSERT INTO Games VALUES(2,'Real Madryt','Shakhtar D.',4,0,false)")

res = conn.exec("select * from Games")

res.each do |row|

  home_team = row['hometeam']
  away_team = row['awayteam']
  home_team_goals = row['hometeamgoals']
  away_team_goals = row['awayteamgoals']

  p "#{home_team} vs #{away_team} #{home_team_goals}:#{away_team_goals}"

end

conn.exec("DROP TABLE IF EXISTS Bets")
conn.exec("CREATE TABLE Bets(Id Integer PRIMARY KEY, GameID Integer, UserID Integer, HomeTeamGoals INT DEFAULT null, AwayTeamGoals INT DEFAULT null, Points INT DEFAULT 0)")
conn.exec("INSERT INTO Bets VALUES(1,1,1,3,1)")
conn.exec("INSERT INTO Bets VALUES(2,1,2,2,0)")
conn.exec("INSERT INTO Bets VALUES(3,2,1,4,1)")
conn.exec("INSERT INTO Bets VALUES(4,2,2,3,0)")

res = conn.exec("select * from Bets")

res.each do |row|

  user = row['userid']
  game = row['gameid']
  home_team_goals = row['hometeamgoals']
  away_team_goals = row['awayteamgoals']

  p "user #{user} predicts that game #{game} will end with score #{home_team_goals}:#{away_team_goals}"

end

conn.close if conn
