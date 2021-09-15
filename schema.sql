DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS countryvictorycity;
DROP TABLE IF EXISTS countryresearch;
DROP TABLE IF EXISTS countryaction;
DROP TABLE IF EXISTS action;
DROP TABLE IF EXISTS unit;
DROP TABLE IF EXISTS victorycity;
DROP TABLE IF EXISTS income;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS research;
DROP TABLE IF EXISTS gamemaster;

CREATE TABLE gamemaster (
  id INT NOT NULL, /* AUTO_INCREMENT, */
  currentcountry INT,
  status VARCHAR(10),
  turn INT NOT NULL,
  date VARCHAR(20),
  PRIMARY KEY(id)
);

CREATE TABLE country (
  id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  ipcs INT NOT NULL,
  gamemaster_id INT NOT NULL,
  PRIMARY KEY(id, gamemaster_id),
  FOREIGN KEY(gamemaster_id) REFERENCES gamemaster(id)
);

CREATE TABLE action (
  id INT NOT NULL,
  type VARCHAR(30) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE countryaction (
  country_id INT NOT NULL,
  action_id INT NOT NULL,
  turn INT NOT NULL,
  date VARCHAR(20) NOT NULL,
  timestamp DATETIME NOT NULL,
  gamemaster_id INT NOT NULL,
  PRIMARY KEY(country_id, action_id, turn, gamemaster_id),
  FOREIGN KEY(country_id) REFERENCES country(id),
  FOREIGN KEY(action_id) REFERENCES action(id),
  FOREIGN KEY(gamemaster_id) REFERENCES gamemaster(id)
);

CREATE TABLE unit (
  id INT NOT NULL,
  name VARCHAR(20) NOT NULL,
  attack INT,
  defense INT,
  movement INT,
  cost INT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE purchase (
  countryaction_id INT NOT NULL,
  unit_id INT NOT NULL,
  turn INT NOT NULL,
  quantity INT NOT NULL,
  totalcost INT NOT NULL,
  gamemaster_id INT NOT NULL,
  PRIMARY KEY(countryaction_id, unit_id, turn, gamemaster_id),
  FOREIGN KEY(countryaction_id) REFERENCES countryaction(country_id),
  FOREIGN KEY(unit_id) REFERENCES unit(id),
  FOREIGN KEY(gamemaster_id) REFERENCES gamemaster(id)
);

CREATE TABLE income (
  countryaction_id INT NOT NULL,
  base INT NOT NULL,
  bonus INT NOT NULL,
  research INT NOT NULL,
  convoy INT NOT NULL,
  turn INT NOT NULL,
  gamemaster_id INT NOT NULL,
  PRIMARY KEY(countryaction_id, turn, gamemaster_id),
  FOREIGN KEY(countryaction_id) REFERENCES country(id),
  FOREIGN KEY(gamemaster_id) REFERENCES gamemaster(id)
);

CREATE TABLE victorycity (
  id INT NOT NULL,
  name VARCHAR(15) NOT NULL,
  isCapital BOOLEAN NOT NULL,
  theater VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE countryvictorycity (
  countryaction_id INT NOT NULL,
  victorycity_id INT NOT NULL,
  turn INT NOT NULL,
  gamemaster_id INT NOT NULL,
  PRIMARY KEY(countryaction_id, victorycity_id, turn, gamemaster_id),
  FOREIGN KEY(countryaction_id) REFERENCES countryaction(country_id),
  FOREIGN KEY(victorycity_id) REFERENCES victorycity(id),
  FOREIGN KEY(gamemaster_id) REFERENCES gamemaster(id)
);

CREATE TABLE research (
  id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  info TEXT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE countryresearch (
  countryaction_id INT NOT NULL,
  research_id INT NOT NULL,
  turn INT NOT NULL,
  gamemaster_id INT NOT NULL,
  PRIMARY KEY(countryaction_id, research_id, turn, gamemaster_id),
  FOREIGN KEY(countryaction_id) REFERENCES countryaction(country_id),
  FOREIGN KEY(research_id) REFERENCES research(id),
  FOREIGN KEY(gamemaster_id) REFERENCES gamemaster(id)
);

/******************************************* Starting Values *******************************************/
INSERT INTO gamemaster VALUES (0, 0, "Incomplete", 1, "Spring/Summer, 1940");

INSERT INTO unit VALUES (0, "Infantry", 1, 2, 1, 3);

INSERT INTO country VALUES (0, "Germany", 30, 0);
INSERT INTO country VALUES (1, "Soviet Union", 37, 0);
INSERT INTO country VALUES (2, "Japan", 26, 0);
INSERT INTO country VALUES (3, "United States", 52, 0);
INSERT INTO country VALUES (4, "China", 12, 0);
INSERT INTO country VALUES (5, "United Kingdom Europe", 28, 0);
INSERT INTO country VALUES (6, "United Kingdom Pacific", 17, 0);
INSERT INTO country VALUES (7, "Italy", 10, 0);
INSERT INTO country VALUES (8, "ANZAC", 10, 0);
INSERT INTO country VALUES (9, "France", 19, 0);

INSERT INTO victorycity VALUES (0, "Berlin", TRUE, "Europe");
INSERT INTO victorycity VALUES (1, "Warsaw", FALSE, "Europe");
INSERT INTO victorycity VALUES (2, "Rome", TRUE, "Europe");
INSERT INTO victorycity VALUES (3, "Paris", TRUE, "Europe");
INSERT INTO victorycity VALUES (4, "Moscow", TRUE, "Europe");
INSERT INTO victorycity VALUES (5, "Leningrad", FALSE, "Europe");
INSERT INTO victorycity VALUES (6, "Stalingrad", FALSE, "Europe");
INSERT INTO victorycity VALUES (7, "London", TRUE, "Europe");
INSERT INTO victorycity VALUES (8, "Cairo", FALSE, "Europe");
INSERT INTO victorycity VALUES (9, "Ottawa", FALSE, "Europe");
INSERT INTO victorycity VALUES (10, "Washington", TRUE, "Europe");
INSERT INTO victorycity VALUES (11, "Tokyo", TRUE, "Pacific");
INSERT INTO victorycity VALUES (12, "Shanghai", FALSE, "Pacific");
INSERT INTO victorycity VALUES (13, "Calcutta", TRUE, "Pacific");
INSERT INTO victorycity VALUES (14, "Hong Kong", FALSE, "Pacific");
INSERT INTO victorycity VALUES (15, "Manila", FALSE, "Pacific");
INSERT INTO victorycity VALUES (16, "San Francisco", FALSE, "Pacific");
INSERT INTO victorycity VALUES (17, "Honolulu", FALSE, "Pacific");
INSERT INTO victorycity VALUES (18, "Sydney", TRUE, "Pacific");

INSERT INTO action VALUES(0, "Initialization");
INSERT INTO action VALUES(1, "Purchase");
INSERT INTO action VALUES(2, "Income");
INSERT INTO action VALUES(3, "Research");
INSERT INTO action VALUES(4, "Captured Victory City");
INSERT INTO action VALUES(5, "Lost Victory City");

INSERT INTO countryaction VALUES (0, 0, 0, "", now(), 0);
INSERT INTO countryaction VALUES (1, 0, 0, "", now(), 0);
INSERT INTO countryaction VALUES (2, 0, 0, "", now(), 0);
INSERT INTO countryaction VALUES (3, 0, 0, "", now(), 0);
INSERT INTO countryaction VALUES (5, 0, 0, "", now(), 0);
INSERT INTO countryaction VALUES (6, 0, 0, "", now(), 0);
INSERT INTO countryaction VALUES (7, 0, 0, "", now(), 0);
INSERT INTO countryaction VALUES (8, 0, 0, "", now(), 0);
INSERT INTO countryaction VALUES (9, 0, 0, "", now(), 0);

INSERT INTO countryvictorycity VALUES (0, 0, 0, 0);
INSERT INTO countryvictorycity VALUES (0, 1, 0, 0);
INSERT INTO countryvictorycity VALUES (7, 2, 0, 0);
INSERT INTO countryvictorycity VALUES (9, 3, 0, 0);
INSERT INTO countryvictorycity VALUES (1, 4, 0, 0);
INSERT INTO countryvictorycity VALUES (1, 5, 0, 0);
INSERT INTO countryvictorycity VALUES (1, 6, 0, 0);
INSERT INTO countryvictorycity VALUES (5, 7, 0, 0);
INSERT INTO countryvictorycity VALUES (5, 8, 0, 0);
INSERT INTO countryvictorycity VALUES (5, 9, 0, 0);
INSERT INTO countryvictorycity VALUES (3, 10, 0, 0);
INSERT INTO countryvictorycity VALUES (2, 11, 0, 0);
INSERT INTO countryvictorycity VALUES (2, 12, 0, 0);
INSERT INTO countryvictorycity VALUES (6, 13, 0, 0);
INSERT INTO countryvictorycity VALUES (6, 14, 0, 0);
INSERT INTO countryvictorycity VALUES (3, 15, 0, 0);
INSERT INTO countryvictorycity VALUES (3, 16, 0, 0);
INSERT INTO countryvictorycity VALUES (3, 17, 0, 0);
INSERT INTO countryvictorycity VALUES (8, 18, 0, 0);

INSERT INTO research VALUES (0, "Advanced Artillery", "");
INSERT INTO research VALUES (1, "Rockets", "");
INSERT INTO research VALUES (2, "Paratroopers", "");
INSERT INTO research VALUES (3, "Increased Factory Production", "");
INSERT INTO research VALUES (4, "War bonds", "");
INSERT INTO research VALUES (5, "Improved Mechanized Infantry", "");
INSERT INTO research VALUES (6, "Super Submarines", "");
INSERT INTO research VALUES (7, "Jet Fighters", "");
INSERT INTO research VALUES (8, "Improved Shipyards", "");
INSERT INTO research VALUES (9, "Radar", "");
INSERT INTO research VALUES (10, "Long Range Aircraft", "");
INSERT INTO research VALUES (11, "Heavy Bombers", "");
