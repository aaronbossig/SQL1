camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> CREATE DATABASE universe;
CREATE DATABASE
postgres=> d\
invalid command \
Try \? for help.
postgres-> \d
Did not find any relations.
postgres-> /d
postgres-> \l
                                 List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| universe  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
+-----------+--------------+----------+---------+---------+-----------------------+
(4 rows)

postgres-> /c universe
postgres-> \c universe
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe->  CREATE TABLE galaxy (galaxy_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, galaxy_type_id INT NOT NULL);
ERROR:  syntax error at or near "d"
LINE 1: d
        ^
universe=>  CREATE TABLE star (star_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, galaxy_id INT NOT NULL);
ERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, CREATE TABLE
universe=>  CREATE TABLE planet (planet_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, star_id INT NOT NULL, planet_type_id INT, has_life BOOLEAN, age_in_mil NUMERIC);
CREATE TABLE
universe=>  CREATE TABLE moon (moon_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, planet_id INT NOT NULL, age_in_mil NUMERIC);
CREATE TABLE
universe=> ALTER TABLE moon ADD PRIMARY KEY (moon_id);
LTER TABLE planet ADD PRIMARY KEY (planet_id);
ALTALTER TABLE
universe=> ALTER TABLE planet ADD PRIMARY KEY (planet_id);
ALTER TABLE
universe=> ALTER TABLE star ADD PRIMARY KEY (star_id);
ALTER TABLE
universe=> ALTER TABLE galaxy ADD PRIMARY KEY (galaxy_id);
ERROR:  relation "galaxy" does not exist
universe=> ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);
ALTER TABLE
universe=> ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star(star_id);
ALTER TABLE
universe=> ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
ERROR:  relation "galaxy" does not exist
universe=>  
universe=> 
universe=> CREATE TABLE galaxy_type (galaxy_type_ID SERIAL NOT NULL, name UNIQUE NOT NULL, class_crit TEXT);
ERROR:  syntax error at or near "UNIQUE"
LINE 1: ...galaxy_type (galaxy_type_ID SERIAL NOT NULL, name UNIQUE NOT...
                                                             ^
universe=> CREATE TABLE galaxy_type (galaxy_type_ID SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, class_crit TEXT);
CREATE TABLE
universe=> ALTER TABLE galaxy_type ADD PRIMARY KEY (galaxy_type_id);
ALTER TABLE
universe=> CREATE TABLE planet_type (planet_type_ID SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, year_defined INT, theoretical BOOLEAN);
CREATE TABLE
universe=> ALTER TABLE planet_type ADD PRIMARY KEY (planet_type_id);
ALTER TABLE
universe=> \d
                          List of relations
+--------+--------------------------------+----------+--------------+
| Schema |              Name              |   Type   |    Owner     |
+--------+--------------------------------+----------+--------------+
| public | galaxy_type                    | table    | freecodecamp |
| public | galaxy_type_galaxy_type_id_seq | sequence | freecodecamp |
| public | moon                           | table    | freecodecamp |
| public | moon_moon_id_seq               | sequence | freecodecamp |
| public | planet                         | table    | freecodecamp |
| public | planet_planet_id_seq           | sequence | freecodecamp |
| public | planet_type                    | table    | freecodecamp |
| public | planet_type_planet_type_id_seq | sequence | freecodecamp |
| public | star                           | table    | freecodecamp |
| public | star_star_id_seq               | sequence | freecodecamp |
+--------+--------------------------------+----------+--------------+
(10 rows)

universe=>  CREATE TABLE galaxy (galaxy_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, galaxy_type_id INT NOT NULL);
CREATE TABLE
universe=> ALTER TABLE galaxy ADD PRIMARY KEY (galaxy_id);
ALTER TABLE
universe=> INSERT INTO galaxy_type (name, class_crit) VALUES ('Elliptical', 'Hubble - Disputed');
INSERT 0 1
universe=> INSERT INTO galaxy_type (name, class_crit) VALUES ('Spiral', 'Hubble');
INSERT 0 1
universe=> INSERT INTO galaxy_type (name, class_crit) VALUES ('S0', 'Hubble');
INSERT 0 1
universe=> INSERT INTO galaxy_type (name, class_crit) VALUES ('Sa', 'Hubble');
INSERT 0 1
universe=> INSERT INTO galaxy_type (name, class_crit) VALUES ('Sb', 'Hubble');
INSERT 0 1
universe=> INSERT INTO galaxy_type (name, class_crit) VALUES ('Sc', 'Hubble');
INSERT 0 1
universe=> INSERT INTO galaxy_type (name, class_crit) VALUES ('SB', 'Hubble');
INSERT 0 1
universe=> INSERT INTO galaxy_type (name, class_crit) VALUES ('Irregular', 'Warranting further classification');
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Chthonian',2003,FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Carbon',2005,TRUE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Coreless',2008,TRUE);
INSERT 0 1
universe=> INSERT INTO planet_type (name,theoretical) VALUES ('Desert',FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name,theoretical) VALUES ('Gas Dwarf',FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Gas Giant',1952,FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name,theoretical) VALUES ('Helium',FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Hycean',2021,TRUE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Ice Giant',1952,FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name,theoretical) VALUES ('Ice Planet',FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name,theoretical) VALUES ('Lava',TRUE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Ocean',1971,TRUE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Protoplanet',2005,FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name,theoretical) VALUES ('Puffy',FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Super-Puff',2012,FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, theoretical) VALUES ('Silicate',FALSE);
INSERT 0 1
universe=> INSERT INTO planet_type (name, theoretical) VALUES ('Terrestrial',FALSE);
INSERT 0 1
universe=> INSERT INTO galaxy(name,galaxy_type_id) VALUES ('Milky Way', 2);
INSERT 0 1
universe=> INSERT INTO galaxy(name,galaxy_type_id) VALUES ('Andromeda', 2);
INSERT 0 1
universe=> INSERT INTO galaxy(name,galaxy_type_id) VALUES ('Sombrero', 1);
INSERT 0 1
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Sol', 1, 4600.1);
ERROR:  column "age_in_mil" of relation "star" does not exist
LINE 1: INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Sol'...
                                           ^
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Sirius', 1, 242.5);
ERROR:  column "age_in_mil" of relation "star" does not exist
LINE 1: INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Siri...
                                           ^
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Polaris', 1, 67.1);
ERROR:  column "age_in_mil" of relation "star" does not exist
LINE 1: INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Pola...
                                           ^
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Deneb', 1, 11.6);
ERROR:  column "age_in_mil" of relation "star" does not exist
LINE 1: INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Dene...
                                           ^
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Atria', 1, 48.0);
ERROR:  column "age_in_mil" of relation "star" does not exist
LINE 1: INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Atri...
                                           ^
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Procyon', 1, 18.7);
ERROR:  column "age_in_mil" of relation "star" does not exist
LINE 1: INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Proc...
                                           ^
universe=> SELECT * FROM star;
+---------+------+-----------+
| star_id | name | galaxy_id |
+---------+------+-----------+
+---------+------+-----------+
(0 rows)

universe=> ALTER TABLE star ADD COLUMN age_in_mil NUMERIC;
ALTER TABLE
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Sol', 1, 4600.1);
INSERT 0 1
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Sirius', 1, 242.5);
INSERT 0 1
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Polaris', 1, 67.1);
INSERT 0 1
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Deneb', 1, 11.6);
INSERT 0 1
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Atria', 1, 48.0);
INSERT 0 1
universe=> 
universe=> INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Procyon', 1, 18.7);
INSERT 0 1
universe=> SELECT * FROM planet ;
+-----------+------+---------+----------------+----------+------------+
| planet_id | name | star_id | planet_type_id | has_life | age_in_mil |
+-----------+------+---------+----------------+----------+------------+
+-----------+------+---------+----------------+----------+------------+
(0 rows)

universe=> ALTER TABLE planet ADD COLUMN year_discovered INT;
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN temp_c NUMERIC;
ALTER TABLE
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Mercury',1,16,FALSE,4503, -3000, 427);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Venus',1,16,FALSE,4503, -1000, 462);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Earth',1,16,TRUE,4503, -5000, 120);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Mars',1,16,TRUE,4503, -2000, 20);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Jupiter',1,16,FALSE,4565, -2000, -110);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Saturn',1,16,FALSE,4543, -2500, -173);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Uranus',1,16,FALSE,4543, 1781, -320);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Neptune',1,16,FALSE,4543, 1846, -201);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('Gilease 1002 b',7,16,FALSE, 2);
ERROR:  insert or update on table "planet" violates foreign key constraint "planet_star_id_fkey"
DETAIL:  Key (star_id)=(7) is not present in table "star".
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('Gilease 1002 c',7,16,FALSE, 2);
ERROR:  insert or update on table "planet" violates foreign key constraint "planet_star_id_fkey"
DETAIL:  Key (star_id)=(7) is not present in table "star".
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 c',8,16,FALSE, 6);
ERROR:  insert or update on table "planet" violates foreign key constraint "planet_star_id_fkey"
DETAIL:  Key (star_id)=(8) is not present in table "star".
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 c',8,16,FALSE, 7);
ERROR:  insert or update on table "planet" violates foreign key constraint "planet_star_id_fkey"
DETAIL:  Key (star_id)=(8) is not present in table "star".
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 d',8,16,FALSE, 7);
ERROR:  insert or update on table "planet" violates foreign key constraint "planet_star_id_fkey"
DETAIL:  Key (star_id)=(8) is not present in table "star".
universe=> SELECT * FROM star;
+---------+---------+-----------+------------+
| star_id |  name   | galaxy_id | age_in_mil |
+---------+---------+-----------+------------+
|       1 | Sol     |         1 |     4600.1 |
|       2 | Sirius  |         1 |      242.5 |
|       3 | Polaris |         1 |       67.1 |
|       4 | Deneb   |         1 |       11.6 |
|       5 | Atria   |         1 |       48.0 |
|       6 | Procyon |         1 |       18.7 |
+---------+---------+-----------+------------+
(6 rows)

universe=> INSERT INTO star (name, galaxy_id) values ('Gilease 1002',1),('GJ 1061',1);
INSERT 0 2
universe=> SELECT * FROM planet;
+-----------+---------+---------+----------------+----------+------------+-----------------+--------+
| planet_id |  name   | star_id | planet_type_id | has_life | age_in_mil | year_discovered | temp_c |
+-----------+---------+---------+----------------+----------+------------+-----------------+--------+
|         1 | Mercury |       1 |             16 | f        |       4503 |           -3000 |    427 |
|         2 | Venus   |       1 |             16 | f        |       4503 |           -1000 |    462 |
|         3 | Earth   |       1 |             16 | t        |       4503 |           -5000 |    120 |
|         4 | Mars    |       1 |             16 | t        |       4503 |           -2000 |     20 |
|         5 | Jupiter |       1 |             16 | f        |       4565 |           -2000 |   -110 |
|         6 | Saturn  |       1 |             16 | f        |       4543 |           -2500 |   -173 |
|         7 | Uranus  |       1 |             16 | f        |       4543 |            1781 |   -320 |
|         8 | Neptune |       1 |             16 | f        |       4543 |            1846 |   -201 |
+-----------+---------+---------+----------------+----------+------------+-----------------+--------+
(8 rows)

universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('Gilease 1002 b',7,16,FALSE, 2);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('Gilease 1002 c',7,16,FALSE, 2);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 c',8,16,FALSE, 6);
INSERT 0 1
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 c',8,16,FALSE, 7);
ERROR:  duplicate key value violates unique constraint "planet_name_key"
DETAIL:  Key (name)=(GJ 1061 c) already exists.
universe=> INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 d',8,16,FALSE, 7);
INSERT 0 1
universe=> SELECT * FROM planet;
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
| planet_id |      name      | star_id | planet_type_id | has_life | age_in_mil | year_discovered | temp_c |
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
|         1 | Mercury        |       1 |             16 | f        |       4503 |           -3000 |    427 |
|         2 | Venus          |       1 |             16 | f        |       4503 |           -1000 |    462 |
|         3 | Earth          |       1 |             16 | t        |       4503 |           -5000 |    120 |
|         4 | Mars           |       1 |             16 | t        |       4503 |           -2000 |     20 |
|         5 | Jupiter        |       1 |             16 | f        |       4565 |           -2000 |   -110 |
|         6 | Saturn         |       1 |             16 | f        |       4543 |           -2500 |   -173 |
|         7 | Uranus         |       1 |             16 | f        |       4543 |            1781 |   -320 |
|         8 | Neptune        |       1 |             16 | f        |       4543 |            1846 |   -201 |
|        14 | Gilease 1002 b |       7 |             16 | f        |            |                 |      2 |
|        15 | Gilease 1002 c |       7 |             16 | f        |            |                 |      2 |
|        16 | GJ 1061 c      |       8 |             16 | f        |            |                 |      6 |
|        18 | GJ 1061 d      |       8 |             16 | f        |            |                 |      7 |
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
(12 rows)

universe=> INSERT INTO moon (name,planet_id,age_in_mil) VALUES ('Luna',3, 4510.3);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id,age_in_mil) VALUES ('Deimos',4);
ERROR:  INSERT has more target columns than expressions
LINE 1: INSERT INTO moon (name,planet_id,age_in_mil) VALUES ('Deimos...
                                         ^
universe=> INSERT INTO moon (name,planet_id) VALUES ('Deimos',10);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(10) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Metis',10);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(10) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Adrastea',5);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Amalthea',5);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Thebe',5);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('io',5);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Europa',5);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Ganymede',5);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Castillo',5);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Dione',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Eneceladus',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Epimetheus',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Prometheus',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Mimas',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Rhea',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Janus',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Tethys',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Titan',12);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(12) is not present in table "planet".
universe=> INSERT INTO moon (name,planet_id) VALUES ('Titania',7);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Oberon',7);
INSERT 0 1
universe=> SELECT * FROM moon;
+---------+----------+-----------+------------+
| moon_id |   name   | planet_id | age_in_mil |
+---------+----------+-----------+------------+
|       1 | Luna     |         3 |     4510.3 |
|       4 | Adrastea |         5 |            |
|       5 | Amalthea |         5 |            |
|       6 | Thebe    |         5 |            |
|       7 | io       |         5 |            |
|       8 | Europa   |         5 |            |
|       9 | Ganymede |         5 |            |
|      10 | Castillo |         5 |            |
|      20 | Titania  |         7 |            |
|      21 | Oberon   |         7 |            |
+---------+----------+-----------+------------+
(10 rows)

universe=> SELECT * FROM planet;
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
| planet_id |      name      | star_id | planet_type_id | has_life | age_in_mil | year_discovered | temp_c |
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
|         1 | Mercury        |       1 |             16 | f        |       4503 |           -3000 |    427 |
|         2 | Venus          |       1 |             16 | f        |       4503 |           -1000 |    462 |
|         3 | Earth          |       1 |             16 | t        |       4503 |           -5000 |    120 |
|         4 | Mars           |       1 |             16 | t        |       4503 |           -2000 |     20 |
|         5 | Jupiter        |       1 |             16 | f        |       4565 |           -2000 |   -110 |
|         6 | Saturn         |       1 |             16 | f        |       4543 |           -2500 |   -173 |
|         7 | Uranus         |       1 |             16 | f        |       4543 |            1781 |   -320 |
|         8 | Neptune        |       1 |             16 | f        |       4543 |            1846 |   -201 |
|        14 | Gilease 1002 b |       7 |             16 | f        |            |                 |      2 |
|        15 | Gilease 1002 c |       7 |             16 | f        |            |                 |      2 |
|        16 | GJ 1061 c      |       8 |             16 | f        |            |                 |      6 |
|        18 | GJ 1061 d      |       8 |             16 | f        |            |                 |      7 |
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
(12 rows)

universe=> INSERT INTO moon (name,planet_id) VALUES ('Dione',8);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Eneceladus',8);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Epimetheus',8);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Prometheus',8);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Mimas',8);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Rhea',8);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Janus',8);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Tethys',8);
INSERT 0 1
universe=> INSERT INTO moon (name,planet_id) VALUES ('Titan',8);
INSERT 0 1
universe=> SELECT * FROM galaxy;
+-----------+-----------+----------------+
| galaxy_id |   name    | galaxy_type_id |
+-----------+-----------+----------------+
|         1 | Milky Way |              2 |
|         2 | Andromeda |              2 |
|         3 | Sombrero  |              1 |
+-----------+-----------+----------------+
(3 rows)

universe=> INSERT INTO galaxy (name, galaxy_type_id) VALUES ('God's Eye),2),('Godzilla',2),('Pinwheel',2);
ERROR:  syntax error at or near "s"
LINE 1: ...T INTO galaxy (name, galaxy_type_id) VALUES ('God's Eye),2),...
                                                             ^
universe=> INSERT INTO galaxy (name, galaxy_type_id) VALUES ('God's Eye',2),('Godzilla',2),('Pinwheel',2);
universe'> ALTER TABLE galaxy ADD COLUMN naked_eye_visible BOOLEAN;
universe'> 
universe'> 
universe'> )
universe'> 
universe'> 
universe'> 
universe'> /
universe'> 
universe'> 
universe'> SELCT *
universe'> 
universe'> 
universe'> 
universe'> 
universe'> dd
universe'> 
universe'>   
universe'> 
universe'> 
universe'> 
universe'> 
universe'> '
universe(> )
universe-> SELECT * FROM GALAXY
universe-> ;
ERROR:  syntax error at or near "s"
LINE 1: ...T INTO galaxy (name, galaxy_type_id) VALUES ('God's Eye',2),...
                                                             ^
ALTER TABLE galaxy ADD COLUMN naked_eye_visible BOOLEAN;


)



/


SELCT *




dd






'
)
SELECT * FROM GALAXY
;
universe'> 
universe'> ')
universe-> SELECT * FROM galaxy;
ERROR:  syntax error at or near "s"
LINE 1: ...T INTO galaxy (name, galaxy_type_id) VALUES ('God's Eye',2),...
                                                             ^
universe=> SELECT * FROM galaxy;
+-----------+-----------+----------------+
| galaxy_id |   name    | galaxy_type_id |
+-----------+-----------+----------------+
|         1 | Milky Way |              2 |
|         2 | Andromeda |              2 |
|         3 | Sombrero  |              1 |
+-----------+-----------+----------------+
(3 rows)

universe=> INSERT INTO galaxy (name, galaxy_type_id) VALUES ('Gods Eye',2),('Godzilla',2),('Pinwheel',2);
INSERT 0 3
universe=> ALTER TABLE galaxy ADD COLUMN naked_eye_visible BOOLEAN;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN naked_eye_visible BOOLEAN;
ALTER TABLE
universe=> SELECT * FROM galaxy;
+-----------+-----------+----------------+-------------------+
| galaxy_id |   name    | galaxy_type_id | naked_eye_visible |
+-----------+-----------+----------------+-------------------+
|         1 | Milky Way |              2 |                   |
|         2 | Andromeda |              2 |                   |
|         3 | Sombrero  |              1 |                   |
|         4 | Gods Eye  |              2 |                   |
|         5 | Godzilla  |              2 |                   |
|         6 | Pinwheel  |              2 |                   |
+-----------+-----------+----------------+-------------------+
(6 rows)

universe=> ALTER TABLE star ADD COLUMN active BOOLEAN;
ALTER TABLE
universe=> UPDATE TABLE galaxy SET active="FALSE";
ERROR:  syntax error at or near "TABLE"
LINE 1: UPDATE TABLE galaxy SET active="FALSE";
               ^
universe=> UPDATE galaxy SET active="FALSE";
ERROR:  column "FALSE" does not exist
LINE 1: UPDATE galaxy SET active="FALSE";
                                 ^
universe=> UPDATE galaxy SET active=FALSE;
ERROR:  column "active" of relation "galaxy" does not exist
LINE 1: UPDATE galaxy SET active=FALSE;
                          ^
universe=> SELECT * FROM galaxy;
+-----------+-----------+----------------+-------------------+
| galaxy_id |   name    | galaxy_type_id | naked_eye_visible |
+-----------+-----------+----------------+-------------------+
|         1 | Milky Way |              2 |                   |
|         2 | Andromeda |              2 |                   |
|         3 | Sombrero  |              1 |                   |
|         4 | Gods Eye  |              2 |                   |
|         5 | Godzilla  |              2 |                   |
|         6 | Pinwheel  |              2 |                   |
+-----------+-----------+----------------+-------------------+
(6 rows)

universe=> ALTER TABLE galaxy ADD COLUMN active BOOLEAN;
ALTER TABLE
universe=> ALTER TABLE star DROP COLUMN active;
ALTER TABLE
universe=> UPDATE galaxy SET active=FALSE;
UPDATE 6
universe=> UPDATE galaxy SET naked_eye_visible=FALSE;
UPDATE 6
universe=> UPDATE galaxy SET naked_eye_visible=TRUE WHERE galaxy_id<=2;
UPDATE 2
universe=> SELECT * FROM star;
+---------+--------------+-----------+------------+-------------------+
| star_id |     name     | galaxy_id | age_in_mil | naked_eye_visible |
+---------+--------------+-----------+------------+-------------------+
|       1 | Sol          |         1 |     4600.1 |                   |
|       2 | Sirius       |         1 |      242.5 |                   |
|       3 | Polaris      |         1 |       67.1 |                   |
|       4 | Deneb        |         1 |       11.6 |                   |
|       5 | Atria        |         1 |       48.0 |                   |
|       6 | Procyon      |         1 |       18.7 |                   |
|       7 | Gilease 1002 |         1 |            |                   |
|       8 | GJ 1061      |         1 |            |                   |
+---------+--------------+-----------+------------+-------------------+
(8 rows)

universe=> UPDATE star SET naked_eye_visible=FALSE;
UPDATE 8
universe=> UPDATE star SET naked_eye_visible=TRUE WHERE star_id<7;
UPDATE 6
universe=> /d star
universe-> \d star
                                            Table "public.star"
+-------------------+-----------------------+-----------+----------+---------------------------------------+
|      Column       |         Type          | Collation | Nullable |                Default                |
+-------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id           | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name              | character varying(30) |           | not null |                                       |
| galaxy_id         | integer               |           | not null |                                       |
| age_in_mil        | numeric               |           |          |                                       |
| naked_eye_visible | boolean               |           |          |                                       |
+-------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe-> 
universe-> 
universe-> 
universe-> 
universe-> /
universe-> \
invalid command \
Try \? for help.
universe-> 
universe-> 
universe-> ;
ERROR:  syntax error at or near "/"
LINE 1: /d star
        ^
universe=> ALTER TABLE star CREATE FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
ERROR:  syntax error at or near "CREATE"
LINE 1: ALTER TABLE star CREATE FOREIGN KEY (galaxy_id) REFERENCES g...
                         ^
universe=> ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE
universe=> SELECT * FROM moon;
+---------+------------+-----------+------------+
| moon_id |    name    | planet_id | age_in_mil |
+---------+------------+-----------+------------+
|       1 | Luna       |         3 |     4510.3 |
|       4 | Adrastea   |         5 |            |
|       5 | Amalthea   |         5 |            |
|       6 | Thebe      |         5 |            |
|       7 | io         |         5 |            |
|       8 | Europa     |         5 |            |
|       9 | Ganymede   |         5 |            |
|      10 | Castillo   |         5 |            |
|      20 | Titania    |         7 |            |
|      21 | Oberon     |         7 |            |
|      22 | Dione      |         8 |            |
|      23 | Eneceladus |         8 |            |
|      24 | Epimetheus |         8 |            |
|      25 | Prometheus |         8 |            |
|      26 | Mimas      |         8 |            |
|      27 | Rhea       |         8 |            |
|      28 | Janus      |         8 |            |
|      29 | Tethys     |         8 |            |
|      30 | Titan      |         8 |            |
+---------+------------+-----------+------------+
(19 rows)

universe=> INSERT INTO moon (name, planet_id, age_in_mil) VALUES ('Kara',8,810.3);
INSERT 0 1
universe=> ALTER TABLE moon ADD COLUMN visit INT;
ALTER TABLE
universe=> UPDATE moon SET visit=1969 where name='Luna';
UPDATE 1
universe=> 