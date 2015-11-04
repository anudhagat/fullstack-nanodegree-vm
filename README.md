rdb-fullstack
=============
This project uses PostgreSQL and python to implements a database that keeps track of players and matches in a Swiss style game tournament. In a Swiss tournament, no players are eliminated and each player is paired with another player that has an equal number of wins.

How to Download:
----------------
Requirements:
Python 2.7 installed on your computer.
PostgreSQL (psql)
Virtual Box.
Vagrant

Using your web browser, go to https://github.com/anudhagat/movietrailers. On the right hand side, in the middle of the page, click the download button to get a zipped version of this project on your computer. Unzip this file on your computer.

How to Run:
-----------
Open psql from the command prompt. Run the command "\i tournament.sql". This will create the "players" and "games" tables in the tournament database and a database view called "gamewins".

Open IDLE (Python GUI) tool. Open the file tournament_test.py using the IDLE (under the File menu, use Open). Run this file, using Run / Run Module menu option.

Expected Result:
----------------
The python test file checks to see if all functions in tournament.py are functioning correctly. If all tests pass, a Success message is printed.

tournament.py has functions to do the following:
to connect to the database tournament,
to enter players into the "players" database table,
to create pairings between playes according to the Swiss tournament style,
to enter games and winners into the "games" database table,
to delete all entries from the "players" and "games" database tables.
