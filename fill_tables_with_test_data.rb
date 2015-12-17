require 'pg'

conn = PGconn.connect("localhost",5432,"","","test","postgres","phoenix")

#fill users table with data
conn.exec("INSERT INTO Users VALUES(1,'ONC46985','Krzysiek','Charzynski')")
conn.exec("INSERT INTO Users VALUES(2,'ULD32533','Wojtek','Drzazgowski')")
conn.exec("INSERT INTO Users VALUES(3,'ZDE480907','Czarek','Andryskowski')")
conn.exec("INSERT INTO Users VALUES(4,'QGV45545','Mateusz','Redynk')")
conn.exec("INSERT INTO Users VALUES(5,'LUM43404','Tymek','Gach')")
conn.exec("INSERT INTO Users VALUES(6,'XUZ47073','Marek','Dubrawa')")
conn.exec("INSERT INTO Users VALUES(7,'JTB32562','Mariusz','Pawlowski')")

#fill games table with data
conn.exec("INSERT INTO Games VALUES(1,'PSG','Malmo',2,0,false)")
conn.exec("INSERT INTO Games VALUES(2,'Real Madryt','Shakhtar D.',4,0,false)")

#fill bets table with data
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
