require 'pg'

conn = PGconn.connect("localhost",5432,"","","test","postgres","phoenix")

#fill phases table with data
conn.exec("INSERT INTO Phases(Name) VALUES('Group Stage - Matchday 1')")
conn.exec("INSERT INTO Phases(Name) VALUES('Group Stage - Matchday 2')")
conn.exec("INSERT INTO Phases(Name) VALUES('Group Stage - Matchday 3')")
conn.exec("INSERT INTO Phases(Name) VALUES('Group Stage - Matchday 4')")
conn.exec("INSERT INTO Phases(Name) VALUES('Group Stage - Matchday 5')")
conn.exec("INSERT INTO Phases(Name) VALUES('Group Stage - Matchday 6')")
conn.exec("INSERT INTO Phases(Name) VALUES('Round of 16 1st leg')")
conn.exec("INSERT INTO Phases(Name) VALUES('Round of 16 2nd leg')")
conn.exec("INSERT INTO Phases(Name) VALUES('Quarter-finals 1st leg')")
conn.exec("INSERT INTO Phases(Name) VALUES('Quarter-finals 2nd leg')")
conn.exec("INSERT INTO Phases(Name) VALUES('Semi-finals 1st leg')")
conn.exec("INSERT INTO Phases(Name) VALUES('Semi-finals 2nd leg')")
conn.exec("INSERT INTO Phases(Name) VALUES('Final')")

#fill users table with data
conn.exec("INSERT INTO Users(DisplayName, Name, Surname) VALUES('ONC46985','Krzysiek','Charzynski')")
conn.exec("INSERT INTO Users(DisplayName, Name, Surname) VALUES('ULD32533','Wojtek','Drzazgowski')")
conn.exec("INSERT INTO Users(DisplayName, Name, Surname) VALUES('ZDE480907','Czarek','Andryskowski')")
conn.exec("INSERT INTO Users(DisplayName, Name, Surname) VALUES('QGV45545','Mateusz','Redynk')")
conn.exec("INSERT INTO Users(DisplayName, Name, Surname) VALUES('LUM43404','Tymek','Gach')")
conn.exec("INSERT INTO Users(DisplayName, Name, Surname) VALUES('XUZ47073','Marek','Dubrawa')")
conn.exec("INSERT INTO Users(DisplayName, Name, Surname) VALUES('JTB32562','Mariusz','Pawlowski')")

#fill games table with data
conn.exec("INSERT INTO Games(HomeTeam, AwayTeam, GroupName, Phase) VALUES('PSG','Malmo','A',1)")
conn.exec("INSERT INTO Games(HomeTeam, AwayTeam, GroupName, Phase) VALUES('Real Madryt','Shakhtar D.','A',1)")
conn.exec("INSERT INTO Games(HomeTeam, AwayTeam, GroupName, Phase) VALUES('Vfl Wolfsburg','CSKA M.','B',1)")
conn.exec("INSERT INTO Games(HomeTeam, AwayTeam, GroupName, Phase) VALUES('PSV','Man. United','B',1)")
conn.exec("INSERT INTO Games(HomeTeam, AwayTeam, GroupName, Phase) VALUES('Galatasaray','Atletico M.','C',1)")
conn.exec("INSERT INTO Games(HomeTeam, AwayTeam, GroupName, Phase) VALUES('Benfica','FK Astana','C',1)")
conn.exec("INSERT INTO Games(HomeTeam, AwayTeam, GroupName, Phase) VALUES('Man. City','Juventus','D',1)")
conn.exec("INSERT INTO Games(HomeTeam, AwayTeam, GroupName, Phase) VALUES('Sevilla FC','Borussia M.','D',1)")

#fill bets table with data
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(1,1,3,1)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(1,2,3,0)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(1,3,2,0)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(1,4,3,0)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(1,5,2,0)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(1,6,2,0)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(1,7,2,0)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(2,1,4,1)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(2,2,3,1)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(2,3,3,0)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(2,4,4,0)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(2,5,3,1)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(2,6,4,1)")
conn.exec("INSERT INTO Bets(GameID,UserID,HomeTeamGoals,AwayTeamGoals) VALUES(2,7,4,0)")
