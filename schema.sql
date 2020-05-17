DROP TABLE IF EXISTS countryresearch;
DROP TABLE IF EXISTS research;
DROP TABLE IF EXISTS victorycity;
DROP TABLE IF EXISTS revenue;
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS country;

CREATE TABLE country (
        c_id INT NOT NULL,
        c_name VARCHAR(30) NOT NULL,
        ipcs INT NOT NULL,
	PRIMARY KEY(c_id)
);
CREATE TABLE purchase (
        p_name VARCHAR(40),
        amount INT NOT NULL,
        c_id INT NOT NULL,
        season_year VARCHAR(20) NOT NULL,
        turn INT NOT NULL,
        PRIMARY KEY(turn),
	FOREIGN KEY(c_id) REFERENCES country(c_id)

);
CREATE TABLE revenue (
        rev_id INT NOT NULL,
        income INT NOT NULL,
        expense INT NOT NULL,
        c_id INT NOT NULL,
	PRIMARY KEY(rev_id),
	FOREIGN KEY(c_id) REFERENCES country(c_id)
);
CREATE TABLE victorycity (
        v_id INT NOT NULL,
        v_name VARCHAR(15) NOT NULL,
        isCapital BOOLEAN,
        side VARCHAR(10),
        c_id INT NOT NULL,
	PRIMARY KEY(v_id),
	FOREIGN KEY(c_id) REFERENCES country(c_id)
);
CREATE TABLE research(
        res_id INT NOT NULL,
        res_name VARCHAR(30),
        PRIMARY KEY(res_id)
);

CREATE TABLE countryresearch (
        c_id INT NOT NULL,
	res_id INT NOT NULL,
        season_year VARCHAR(20) NOT NULL,
        turn INT NOT NULL,
	FOREIGN KEY(c_id) REFERENCES country(c_id),
	FOREIGN KEY(res_id) REFERENCES research(res_id)
);
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


INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (0, "Berlin", TRUE, "Europe", 0);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (1, "Warsaw", FALSE, "Europe", 0);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (2, "Rome", TRUE, "Europe", 7);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (3, "Paris", TRUE, "Europe", 9);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (4, "Moscow", TRUE, "Europe", 1);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (5, "Leningrad", FALSE, "Europe", 1);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (6, "Stalingrad", FALSE, "Europe", 1);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (7, "London", TRUE, "Europe", 5);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (8, "Cairo", FALSE, "Europe", 5);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (9, "Ottawa", FALSE, "Europe", 5);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (10, "Washington", TRUE, "Europe", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (11, "Tokyo", TRUE, "Pacific", 2);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (12, "Shanghai", FALSE, "Pacific", 2);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (13, "Calcutta", TRUE, "Pacific", 6);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (14, "Hong Kong", FALSE, "Pacific", 6);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (15, "Manila", FALSE, "Pacific", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (16, "San Francisco", FALSE, "Pacific", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (17, "Honolulu", FALSE, "Pacific", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (18, "Sydney", TRUE, "Pacific", 8);

INSERT INTO research(res_id, res_name) VALUES (0, "Advanced Artillery");
INSERT INTO research(res_id, res_name) VALUES (1, "Rockets");
INSERT INTO research(res_id, res_name) VALUES (2, "Paratroopers");
INSERT INTO research(res_id, res_name) VALUES (3, "Increased Factory Production");
INSERT INTO research(res_id, res_name) VALUES (4, "War bonds");
INSERT INTO research(res_id, res_name) VALUES (5, "Improved Mechanized Infantry");
INSERT INTO research(res_id, res_name) VALUES (6, "Super Submarines");
INSERT INTO research(res_id, res_name) VALUES (7, "Jet Fighters");
INSERT INTO research(res_id, res_name) VALUES (8, "Radar");
INSERT INTO research(res_id, res_name) VALUES (9, "Improved Shipyards");
INSERT INTO research(res_id, res_name) VALUES (10, "Long Range Aircraft");
INSERT INTO research(res_id, res_name) VALUES (11, "Heavy Bombers");



