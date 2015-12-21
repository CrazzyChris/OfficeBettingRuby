require 'pg'

conn = PGconn.connect("localhost",5432,"","","test","postgres","phoenix")

def place_bet(game_id,predicted_home_goals,predicted_away_goals,conn)
  user_id = 1
  conn.exec("SELECT setval('bets_id_seq', (SELECT MAX(id) FROM bets));")
  conn.exec("DO $do$ BEGIN IF (SELECT EXISTS(SELECT true from bets where gameid=#{game_id} and userid=#{user_id})) THEN UPDATE bets SET hometeamgoals=#{predicted_home_goals}, awayteamgoals=#{predicted_away_goals} WHERE gameid=#{game_id} and userid=#{user_id}; ELSE INSERT INTO bets (gameid,userid,hometeamgoals,awayteamgoals) VALUES (#{game_id},#{user_id},#{predicted_home_goals},#{predicted_away_goals}); END IF; END $do$")
end

#place_bet(3,4,3,conn)
#place_bet(4,2,2,conn)

def add_game(home_team,away_team,conn,phase,group)
  conn.exec("SELECT setval('games_id_seq', (SELECT MAX(id) FROM games));")
  conn.exec("DO $do$ BEGIN IF (SELECT EXISTS(SELECT true from games where hometeam='Real Madryt' and awayteam='PSG')) THEN ELSE INSERT INTO games (hometeam,awayteam) VALUES ('Real Madryt','PSG'); END IF; END $do$")
end

#add_game("'Vfl Wolfsburg'","'CSKA M.'",conn)

def set_score(game_id,home_team_goals,away_team_goals,conn)
  conn.exec("UPDATE games SET hometeamgoals=#{home_team_goals}, awayteamgoals=#{away_team_goals} WHERE id=#{game_id}")
end

#set_score(3,4,3,conn)

def promote_game(game_id,conn)
  conn.exec("UPDATE games SET ispremium=true WHERE id=#{game_id}")
end

#promote_game(3,conn)
#promote_game(2,conn)

if true

p "i will do this"

#Drop all Tables
conn.exec("DROP TABLE IF EXISTS Bets")
conn.exec("DROP TABLE IF EXISTS Games")
conn.exec("DROP TABLE IF EXISTS Phases")
conn.exec("DROP TABLE IF EXISTS Users")

#Create Phase Table
conn.exec("CREATE TABLE Phases(Id serial PRIMARY KEY, Name VARCHAR(40))")

#Create User Table
conn.exec("CREATE TABLE Users(Id serial PRIMARY KEY, DisplayName VARCHAR(20), Name VARCHAR(20), Surname VARCHAR(20), Points INT DEFAULT 0)")

#Create Games Table
conn.exec("CREATE TABLE Games(Id serial PRIMARY KEY,HomeTeam VARCHAR(20),AwayTeam VARCHAR(20),GroupName VARCHAR(1),Phase INT REFERENCES Phases(id),HomeTeamGoals INT DEFAULT null,AwayTeamGoals INT DEFAULT null,ispremium BOOLEAN DEFAULT FALSE)")

#Create Bets Table
conn.exec("CREATE TABLE Bets(Id serial PRIMARY KEY,GameID INT REFERENCES Games(id),UserID INT REFERENCES Users(id),HomeTeamGoals INT DEFAULT null,AwayTeamGoals INT DEFAULT null,Points INT DEFAULT 0)")

else
  p "i didn't do this db shit"
end

conn.close if conn
