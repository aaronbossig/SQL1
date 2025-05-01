 CREATE TABLE galaxy (galaxy_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, galaxy_type_id INT NOT NULL);
 CREATE TABLE star (star_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, galaxy_id INT NOT NULL);
 CREATE TABLE planet (planet_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, star_id INT NOT NULL, planet_type_id INT, has_life BOOLEAN, age_in_mil NUMERIC);
 CREATE TABLE moon (moon_id SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, planet_id INT NOT NULL, age_in_mil NUMERIC);
ALTER TABLE moon ADD PRIMARY KEY (moon_id);
ALTER TABLE planet ADD PRIMARY KEY (planet_id);
ALTER TABLE star ADD PRIMARY KEY (star_id);
ALTER TABLE galaxy ADD PRIMARY KEY (galaxy_id);
ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);
ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star(star_id);
ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
 

CREATE TABLE galaxy_type (galaxy_type_ID SERIAL NOT NULL, name UNIQUE NOT NULL, class_crit TEXT);
CREATE TABLE galaxy_type (galaxy_type_ID SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, class_crit TEXT);
ALTER TABLE galaxy_type ADD PRIMARY KEY (galaxy_type_id);
CREATE TABLE planet_type (planet_type_ID SERIAL NOT NULL, name VARCHAR(30) UNIQUE NOT NULL, year_defined INT, theoretical BOOLEAN);
ALTER TABLE planet_type ADD PRIMARY KEY (planet_type_id);





INSERT INTO galaxy_type (name, class_crit) VALUES ('Elliptical', 'Hubble - Disputed');
INSERT INTO galaxy_type (name, class_crit) VALUES ('Spiral', 'Hubble');
INSERT INTO galaxy_type (name, class_crit) VALUES ('S0', 'Hubble');
INSERT INTO galaxy_type (name, class_crit) VALUES ('Sa', 'Hubble');
INSERT INTO galaxy_type (name, class_crit) VALUES ('Sb', 'Hubble');
INSERT INTO galaxy_type (name, class_crit) VALUES ('Sc', 'Hubble');
INSERT INTO galaxy_type (name, class_crit) VALUES ('SB', 'Hubble');
INSERT INTO galaxy_type (name, class_crit) VALUES ('Irregular', 'Warranting further classification');

postgres=> Select * from galaxy_type;
+----------------+------------+-----------------------------------+
| galaxy_type_id |    name    |            class_crit             |
+----------------+------------+-----------------------------------+
|              1 | Elliptical | Hubble - Disputed                 |
|              2 | Spirall    | Hubble                            |
|              3 | S0         | Hubble                            |
|              4 | Sa         | Hubble                            |
|              5 | Sb         | Hubble                            |
|              6 | Sc         | Hubble                            |
|              7 | SB         | Hubble                            |
|              8 | Irregular  | Warranting further classification |
+----------------+------------+-----------------------------------+
(8 rows)

postgres=> UPDATE TABLE galaxy_type SET name="Spiral" where name="Spirall";
ERROR:  syntax error at or near "TABLE"
LINE 1: UPDATE TABLE galaxy_type SET name="Spiral" where name="Spira...
               ^
postgres=> UPDATE COLUMN galaxy_type SET name="Spiral" where name="Spirall";
ERROR:  syntax error at or near "COLUMN"
LINE 1: UPDATE COLUMN galaxy_type SET name="Spiral" where name="Spir...
               ^
postgres=> UPDATE  galaxy_type SET name="Spiral" where name="Spirall";
ERROR:  column "Spirall" does not exist
LINE 1: UPDATE  galaxy_type SET name="Spiral" where name="Spirall";
                                                         ^
postgres=> Select * from galaxy_type;
+----------------+------------+-----------------------------------+
| galaxy_type_id |    name    |            class_crit             |
+----------------+------------+-----------------------------------+
|              1 | Elliptical | Hubble - Disputed                 |
|              2 | Spirall    | Hubble                            |
|              3 | S0         | Hubble                            |
|              4 | Sa         | Hubble                            |
|              5 | Sb         | Hubble                            |
|              6 | Sc         | Hubble                            |
|              7 | SB         | Hubble                            |
|              8 | Irregular  | Warranting further classification |
+----------------+------------+-----------------------------------+
(8 rows)

postgres=> UPDATE galaxy_type SET name="Spiral" where name="Spirall";
ERROR:  column "Spirall" does not exist
LINE 1: UPDATE galaxy_type SET name="Spiral" where name="Spirall";
                                                        ^
postgres=> UPDATE galaxy_type SET name='Spiral' where name='Spirall';
UPDATE 1
postgres=> Select * from galaxy_type;
+----------------+------------+-----------------------------------+
| galaxy_type_id |    name    |            class_crit             |
+----------------+------------+-----------------------------------+
|              1 | Elliptical | Hubble - Disputed                 |
|              3 | S0         | Hubble                            |
|              4 | Sa         | Hubble                            |
|              5 | Sb         | Hubble                            |
|              6 | Sc         | Hubble                            |
|              7 | SB         | Hubble                            |
|              8 | Irregular  | Warranting further classification |
|              2 | Spiral     | Hubble                            |
+----------------+------------+-----------------------------------+
(8 rows)

postgres=> SELECT * FROM planet_types;
ERROR:  relation "planet_types" does not exist
LINE 1: SELECT * FROM planet_types;
                      ^
postgres=> \d
                          List of relations
+--------+--------------------------------+----------+--------------+
| Schema |              Name              |   Type   |    Owner     |
+--------+--------------------------------+----------+--------------+
| public | galaxy                         | table    | freecodecamp |
| public | galaxy_galaxy_id_seq           | sequence | freecodecamp |
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
(12 rows)

postgres=> SELECT * FROM planet_type;
+----------------+------+--------------+-------------+
| planet_type_id | name | year_defined | theoretical |
+----------------+------+--------------+-------------+
+----------------+------+--------------+-------------+
(0 rows)

INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Chthonian',2003,FALSE);
INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Carbon',2005,TRUE);
INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Coreless',2008,TRUE);
INSERT INTO planet_type (name,theoretical) VALUES ('Desert',FALSE);
INSERT INTO planet_type (name,theoretical) VALUES ('Gas Dwarf',FALSE);
INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Gas Giant',1952,FALSE);
INSERT INTO planet_type (name,theoretical) VALUES ('Helium',FALSE);
INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Hycean',2021,TRUE);
INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Ice Giant',1952,FALSE);
INSERT INTO planet_type (name,theoretical) VALUES ('Ice Planet',FALSE);
INSERT INTO planet_type (name,theoretical) VALUES ('Lava',TRUE);
INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Ocean',1971,TRUE);
INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Protoplanet',2005,FALSE);
INSERT INTO planet_type (name,theoretical) VALUES ('Puffy',FALSE);
INSERT INTO planet_type (name, year_defined,theoretical) VALUES ('Super-Puff',2012,FALSE);
INSERT INTO planet_type (name, theoretical) VALUES ('Silicate',FALSE);
NSERT INTO planet_type (name, theoretical) VALUES ('Terrestrial',FALSE);



1
postgres=> Select * from planet_type;
+----------------+-------------+--------------+-------------+
| planet_type_id |    name     | year_defined | theoretical |
+----------------+-------------+--------------+-------------+
|              1 | Chthonian   |         2003 | f           |
|              2 | Carbon      |         2005 | t           |
|              3 | Coreless    |         2008 | t           |
|              4 | Desert      |              | f           |
|              5 | Gas Dwarf   |              | f           |
|              6 | Gas Giant   |         1952 | f           |
|              7 | Helium      |              | f           |
|              8 | Hycean      |         2021 | t           |
|              9 | Ice Giant   |         1952 | f           |
|             10 | Ice Planet  |              | f           |
|             11 | Lava        |              | t           |
|             12 | Ocean       |         1971 | t           |
|             13 | Protoplanet |         2005 | f           |
|             14 | Puffy       |              | f           |
|             15 | Super-Puff  |         2012 | f           |
|             16 | Silicate    |              | f           |
|             17 | Terrestrial |              | f           |
+----------------+-------------+--------------+-------------+
(17 rows)

postgres=> Select * from galaxy_type;
+----------------+------------+-----------------------------------+
| galaxy_type_id |    name    |            class_crit             |
+----------------+------------+-----------------------------------+
|              1 | Elliptical | Hubble - Disputed                 |
|              3 | S0         | Hubble                            |
|              4 | Sa         | Hubble                            |
|              5 | Sb         | Hubble                            |
|              6 | Sc         | Hubble                            |
|              7 | SB         | Hubble                            |
|              8 | Irregular  | Warranting further classification |
|              2 | Spiral     | Hubble                            |
+----------------+------------+-----------------------------------+
(8 rows)

postgres=> SELECT * FROM galaxy;
+-----------+------+----------------+
| galaxy_id | name | galaxy_type_id |
+-----------+------+----------------+
+-----------+------+----------------+
(0 rows)

INSERT INTO galaxy(name,galaxy_type_id) VALUES ('Milky Way', 2);
INSERT INTO galaxy(name,galaxy_type_id) VALUES ('Andromeda', 2);
INSERT INTO galaxy(name,galaxy_type_id) VALUES ('Sombrero', 1);

postgres=> SELECT * FROM galaxy;
+-----------+-----------+----------------+
| galaxy_id |   name    | galaxy_type_id |
+-----------+-----------+----------------+
|         1 | Milky Way |              2 |
|         2 | Andromeda |              2 |
|         3 | Sombrero  |              1 |
+-----------+-----------+----------------+
(3 rows)

postgres=> SELECT * FROM star;
+---------+------+-----------+------------+
| star_id | name | galaxy_id | age_in_mil |
+---------+------+-----------+------------+
+---------+------+-----------+------------+
(0 rows)

INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Sol', 1, 4600.1);

INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Sirius', 1, 242.5);

INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Polaris', 1, 67.1);

INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Deneb', 1, 11.6);

INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Atria', 1, 48.0);

INSERT INTO star (name, galaxy_id, age_in_mil) VALUES ('Procyon', 1, 18.7);

postgres=> SELECT * FROM star;
+---------+---------+-----------+------------+
| star_id |  name   | galaxy_id | age_in_mil |
+---------+---------+-----------+------------+
|       1 | Sol     |         1 |    4600.10 |
|       2 | Sirius  |         1 |     242.50 |
|       3 | Polaris |         1 |      67.10 |
|       4 | Deneb   |         1 |      11.60 |
|       5 | Atria   |         1 |      48.00 |
|       6 | Procyon |         1 |      18.70 |
+---------+---------+-----------+------------+
(6 rows)

postgres=> SELECT * FROM planet;
+-----------+------+---------+----------------+----------+------------+-----------------+--------+
| planet_id | name | star_id | planet_type_id | has_life | age_in_mil | year_discovered | temp_c |
+-----------+------+---------+----------------+----------+------------+-----------------+--------+
+-----------+------+---------+----------------+----------+------------+-----------------+--------+
(0 rows)

postgres=> INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Mercury',1,16,FALSE,4503, 427);
ERROR:  INSERT has more target columns than expressions
LINE 1: ...t_type_id, has_life, age_in_mil, year_discovered, temp_c) VA...
                                                             ^
INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Mercury',1,16,FALSE,4503, -3000, 427);
INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Venus',1,16,FALSE,4503, -1000, 462);
INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Earth',1,16,TRUE,4503, -5000, 120);
INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Mars',1,16,TRUE,4503, -2000, 20);
INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Jupiter',1,16,FALSE,4565, -2000, -110);
INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Saturn',1,16,FALSE,4543, -2500, -173);
INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Uranus',1,16,FALSE,4543, 1781, -320);
INSERT INTO planet (name, star_id, planet_type_id, has_life, age_in_mil, year_discovered, temp_c) VALUES ('Neptune',1,16,FALSE,4543, 1846, -201);
INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('Gilease 1002 b',7,16,FALSE, 2);
INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('Gilease 1002 c',7,16,FALSE, 2);
INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 c',8,16,FALSE, 6);
INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 c',8,16,FALSE, 7);
INSERT INTO planet (name, star_id, planet_type_id, has_life,  temp_c) VALUES ('GJ 1061 d',8,16,FALSE, 7);

postgres=> SELECT * FROM star;
+---------+--------------+-----------+------------+
| star_id |     name     | galaxy_id | age_in_mil |
+---------+--------------+-----------+------------+
|       1 | Sol          |         1 |    4600.10 |
|       2 | Sirius       |         1 |     242.50 |
|       3 | Polaris      |         1 |      67.10 |
|       4 | Deneb        |         1 |      11.60 |
|       5 | Atria        |         1 |      48.00 |
|       6 | Procyon      |         1 |      18.70 |
|       7 | Gilease 1002 |         1 |       1.00 |
|       8 | GJ 1061      |         1 |       7.00 |
+---------+--------------+-----------+------------+
(8 rows)

postgres=> SELECT * FROM planet;
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
| planet_id |      name      | star_id | planet_type_id | has_life | age_in_mil | year_discovered | temp_c |
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
|         1 | Mercury        |       1 |             16 | f        |       4503 |           -3000 |    427 |
|         2 | Venus          |       1 |             16 | f        |       4503 |           -1000 |    462 |
|         5 | Jupiter        |       1 |             16 | f        |       4565 |           -2000 |   -110 |
|         6 | Saturn         |       1 |             16 | f        |       4543 |           -2500 |   -173 |
|         7 | Uranus         |       1 |             16 | f        |       4543 |            1781 |   -320 |
|         8 | Neptune        |       1 |             16 | f        |       4543 |            1846 |   -201 |
|         3 | Earth          |       1 |             16 | t        |       4503 |           -5000 |    120 |
|         4 | Mars           |       1 |             16 | t        |       4503 |           -2000 |     20 |
|         9 | Gilease 1002 b |       7 |             16 | f        |            |                 |      2 |
|        10 | Gilease 1002 c |       7 |             16 | f        |            |                 |      2 |
|        11 | GJ 1061 c      |       8 |             16 | f        |            |                 |      6 |
|        13 | GJ 1061 d      |       8 |             16 | f        |            |                 |      7 |
+-----------+----------------+---------+----------------+----------+------------+-----------------+--------+
(12 rows)

postgres=> SELECT * FROM moon;
+---------+------+-----------+------------+
| moon_id | name | planet_id | age_in_mil |
+---------+------+-----------+------------+
+---------+------+-----------+------------+
(0 rows)

INSERT INTO moon (name,planet_id,age_in_mil) VALUES ('Luna',3, 4510.3);
INSERT INTO moon (name,planet_id,age_in_mil) VALUES ('Deimos',4);
INSERT INTO moon (name,planet_id) VALUES ('Deimos',10);
INSERT INTO moon (name,planet_id) VALUES ('Metis',10);
INSERT INTO moon (name,planet_id) VALUES ('Adrastea',5);
INSERT INTO moon (name,planet_id) VALUES ('Amalthea',5);
INSERT INTO moon (name,planet_id) VALUES ('Thebe',5);
INSERT INTO moon (name,planet_id) VALUES ('io',5);
INSERT INTO moon (name,planet_id) VALUES ('Europa',5);
INSERT INTO moon (name,planet_id) VALUES ('Ganymede',5);
INSERT INTO moon (name,planet_id) VALUES ('Castillo',5);
INSERT INTO moon (name,planet_id) VALUES ('Dione',12);
INSERT INTO moon (name,planet_id) VALUES ('Eneceladus',12);
INSERT INTO moon (name,planet_id) VALUES ('Epimetheus',12);
INSERT INTO moon (name,planet_id) VALUES ('Prometheus',12);
INSERT INTO moon (name,planet_id) VALUES ('Mimas',12);
INSERT INTO moon (name,planet_id) VALUES ('Rhea',12);
INSERT INTO moon (name,planet_id) VALUES ('Janus',12);
INSERT INTO moon (name,planet_id) VALUES ('Tethys',12);
INSERT INTO moon (name,planet_id) VALUES ('Titan',12);
INSERT INTO moon (name,planet_id) VALUES ('Titania',7);
INSERT INTO moon (name,planet_id) VALUES ('Oberon',7);



INSERT 0 1
postgres=> \l
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

postgres=> \d
                          List of relations
+--------+--------------------------------+----------+--------------+
| Schema |              Name              |   Type   |    Owner     |
+--------+--------------------------------+----------+--------------+
| public | galaxy                         | table    | freecodecamp |
| public | galaxy_galaxy_id_seq           | sequence | freecodecamp |
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
(12 rows)

postgres=> \c universe
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe=> \l
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

universe=> \d
Did not find any relations.
universe=> /d
universe-> \d
Did not find any relations.
universe-> \l
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

universe-> SELECT * FROM moon;
ERROR:  syntax error at or near "/"
LINE 1: /d
        ^
universe=> SELECT * FROM moon;
ERROR:  relation "moon" does not exist
LINE 1: SELECT * FROM moon;
                      ^
universe=> 
universe=> SELECT * FROM moon;
ERROR:  relation "moon" does not exist
LINE 1: SELECT * FROM moon;
                      ^
universe=> SELECT * FROM moon;
ERROR:  relation "moon" does not exist
LINE 1: SELECT * FROM moon;
                      ^
universe=> SELECT * FROM moon;
ERROR:  relation "moon" does not exist
LINE 1: SELECT * FROM moon;
                      ^
universe=> SELECT * FROM moon;
ERROR:  relation "moon" does not exist
LINE 1: SELECT * FROM moon;
                      ^
universe=> \l
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

universe=> \d
Did not find any relations.
universe=> 

