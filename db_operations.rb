require 'pg'

conn = PGconn.connect("localhost",5432,"","","test","postgres","phoenix")

def place_bet(game_id,predicted_home_goals,predicted_away_goals,conn)
  user_id = 1
  conn.exec("SELECT setval('bets_id_seq', (SELECT MAX(id) FROM bets));")
  conn.exec("INSERT INTO Bets (gameid,userid,hometeamgoals,awayteamgoals) VALUES(#{game_id},#{user_id},#{predicted_home_goals},#{predicted_away_goals})")
end

place_bet(3,3,2,conn)

if false
  p "i will do this"
#Create and show values from User Table
conn.exec("DROP TABLE IF EXISTS Users")
conn.exec("CREATE TABLE Users(Id Integer PRIMARY KEY, DisplayName VARCHAR(20), Name VARCHAR(20), Surname VARCHAR(20), Points INT DEFAULT 0)")
conn.exec("INSERT INTO Users VALUES(1,'ONC46985','Krzysiek','Charzynski')")
conn.exec("INSERT INTO Users VALUES(2,'ULD32533','Wojtek','Drzazgowski')")
conn.exec("INSERT INTO Users VALUES(3,'ZDE480907','Czarek','Andryskowski')")
conn.exec("INSERT INTO Users VALUES(4,'QGV45545','Mateusz','Redynk')")
conn.exec("INSERT INTO Users VALUES(5,'LUM43404','Tymek','Gach')")
conn.exec("INSERT INTO Users VALUES(6,'XUZ47073','Marek','Dubrawa')")
conn.exec("INSERT INTO Users VALUES(7,'JTB32562','Mariusz','Pawlowski')")

res = conn.exec("select * from Users")

res.each do |row|

  username = row['displayname']
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
conn.exec("CREATE TABLE Bets(Id serial PRIMARY KEY, GameID Integer, UserID Integer, HomeTeamGoals INT DEFAULT null, AwayTeamGoals INT DEFAULT null, Points INT DEFAULT 0)")
conn.exec("INSERT INTO Bets VALUES(1,1,1,3,1)")
conn.exec("INSERT INTO Bets VALUES(2,1,2,3,0)")
conn.exec("INSERT INTO Bets VALUES(3,1,3,2,0)")
conn.exec("INSERT INTO Bets VALUES(4,1,4,3,0)")
conn.exec("INSERT INTO Bets VALUES(5,1,5,2,0)")
conn.exec("INSERT INTO Bets VALUES(6,1,6,2,0)")
conn.exec("INSERT INTO Bets VALUES(7,1,7,2,0)")
conn.exec("INSERT INTO Bets VALUES(8,2,1,4,1)")
conn.exec("INSERT INTO Bets VALUES(9,2,2,3,1)")
conn.exec("INSERT INTO Bets VALUES(10,2,3,3,0)")
conn.exec("INSERT INTO Bets VALUES(11,2,4,4,0)")
conn.exec("INSERT INTO Bets VALUES(12,2,5,3,1)")
conn.exec("INSERT INTO Bets VALUES(13,2,6,4,1)")
conn.exec("INSERT INTO Bets VALUES(14,2,7,4,0)")

res = conn.exec("select * from Bets")

res.each do |row|

  user = row['userid']
  game = row['gameid']
  home_team_goals = row['hometeamgoals']
  away_team_goals = row['awayteamgoals']

  p "user #{user} predicts that game #{game} will end with score #{home_team_goals}:#{away_team_goals}"

end

else
  p "i didn't do this db shit"
end

conn.close if conn
