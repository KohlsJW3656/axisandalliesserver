DROP TABLE IF EXISTS countryresearch;
DROP TABLE IF EXISTS unit;
DROP TABLE IF EXISTS countryaction;
DROP TABLE IF EXISTS research;
DROP TABLE IF EXISTS victorycity;
DROP TABLE IF EXISTS income;
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS country; 

CREATE TABLE gamemaster (
  g_id INT NOT NULL,
  currentcountry INT,
  turn INT,
  season_year VARCHAR(20),
  PRIMARY KEY(g_id),
  FOREIGN KEY(currentcountry) REFERENCES country(c_id)
);

CREATE TABLE country (
	c_id INT NOT NULL,
	c_name VARCHAR(30) NOT NULL,
	ipcs INT NOT NULL,
	PRIMARY KEY(c_id)
);

CREATE TABLE countryaction (
	c_id INT NOT NULL,
	action VARCHAR(10),
	turn INT NOT NULL,
	season_year VARCHAR(20) NOT NULL,
	PRIMARY KEY(c_id, turn),
	FOREIGN KEY(c_id) REFERENCES country(c_id)
);

CREATE TABLE unit (
	u_id INT NOT NULL,
	u_name VARCHAR(20) NOT NULL,
	attack INT,
	defense INT,
	movement INT NOT NULL,
	cost INT NOT NULL,
	PRIMARY KEY(u_id)
);

CREATE TABLE purchase (
	u_id INT NOT NULL,
	c_id INT NOT NULL,
	amount INT NOT NULL,
	turn INT NOT NULL,
	time DATE NOT NULL,
	PRIMARY KEY(u_id, c_id, turn),
	FOREIGN KEY(c_id) REFERENCES countryaction(c_id),
  FOREIGN KEY(u_id) REFERENCES unit(u_id)
);

CREATE TABLE income (
	c_id INT NOT NULL,
	base INT NOT NULL,
	bonus INT NOT NULL,
	research INT NOT NULL,
	convoy INT NOT NULL,
	turn INT NOT NULL,
	PRIMARY KEY(c_id, turn),
	FOREIGN KEY(c_id) REFERENCES country(c_id)
);

CREATE TABLE victorycity (
	v_id INT NOT NULL,
	v_name VARCHAR(15) NOT NULL,
	isCapital BOOLEAN NOT NULL,
	theater VARCHAR(10) NOT NULL,
	c_id INT NOT NULL,
	PRIMARY KEY(v_id, c_id),
	FOREIGN KEY(c_id) REFERENCES country(c_id)
);

CREATE TABLE research(
	r_id INT NOT NULL,
	r_name VARCHAR(30),
	PRIMARY KEY(r_id)
);

CREATE TABLE countryresearch (
	c_id INT NOT NULL,
	r_id INT NOT NULL,
	turn INT NOT NULL,
	PRIMARY KEY(c_id, r_id),
	FOREIGN KEY(c_id) REFERENCES country(c_id),
	FOREIGN KEY(r_id) REFERENCES research(r_id)
);

/******************************************* Starting Values *******************************************/
INSERT INTO country(c_id, c_name, ipcs) VALUES (0, "Germany", 30);
INSERT INTO country(c_id, c_name, ipcs) VALUES (1, "Soviet Union", 37);
INSERT INTO country(c_id, c_name, ipcs) VALUES (2, "Japan", 26);
INSERT INTO country(c_id, c_name, ipcs) VALUES (3, "United States", 52);
INSERT INTO country(c_id, c_name, ipcs) VALUES (4, "China", 12);
INSERT INTO country(c_id, c_name, ipcs) VALUES (5, "United Kingdom Europe", 28);
INSERT INTO country(c_id, c_name, ipcs) VALUES (6, "United Kingdom Pacific", 17);
INSERT INTO country(c_id, c_name, ipcs) VALUES (7, "Italy", 10);
INSERT INTO country(c_id, c_name, ipcs) VALUES (8, "ANZAC", 10);
INSERT INTO country(c_id, c_name, ipcs) VALUES (9, "France", 19);

INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (0, "Berlin", TRUE, "Europe", 0);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (1, "Warsaw", FALSE, "Europe", 0);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (2, "Rome", TRUE, "Europe", 7);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (3, "Paris", TRUE, "Europe", 9);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (4, "Moscow", TRUE, "Europe", 1);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (5, "Leningrad", FALSE, "Europe", 1);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (6, "Stalingrad", FALSE, "Europe", 1);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (7, "London", TRUE, "Europe", 5);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (8, "Cairo", FALSE, "Europe", 5);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (9, "Ottawa", FALSE, "Europe", 5);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (10, "Washington", TRUE, "Europe", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (11, "Tokyo", TRUE, "Pacific", 2);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (12, "Shanghai", FALSE, "Pacific", 2);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (13, "Calcutta", TRUE, "Pacific", 6);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (14, "Hong Kong", FALSE, "Pacific", 6);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (15, "Manila", FALSE, "Pacific", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (16, "San Francisco", FALSE, "Pacific", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (17, "Honolulu", FALSE, "Pacific", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, theater, c_id) VALUES (18, "Sydney", TRUE, "Pacific", 8);

INSERT INTO research(r_id, r_name) VALUES (0, "Advanced Artillery");
INSERT INTO research(r_id, r_name) VALUES (1, "Rockets");
INSERT INTO research(r_id, r_name) VALUES (2, "Paratroopers");
INSERT INTO research(r_id, r_name) VALUES (3, "Increased Factory Production");
INSERT INTO research(r_id, r_name) VALUES (4, "War bonds");
INSERT INTO research(r_id, r_name) VALUES (5, "Improved Mechanized Infantry");
INSERT INTO research(r_id, r_name) VALUES (6, "Super Submarines");
INSERT INTO research(r_id, r_name) VALUES (7, "Jet Fighters");
INSERT INTO research(r_id, r_name) VALUES (8, "Improved Shipyards");
INSERT INTO research(r_id, r_name) VALUES (9, "Radar");
INSERT INTO research(r_id, r_name) VALUES (10, "Long Range Aircraft");
INSERT INTO research(r_id, r_name) VALUES (11, "Heavy Bombers");