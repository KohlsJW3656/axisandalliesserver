DROP TABLE IF EXISTS countryresearch;
DROP TABLE IF EXISTS research;
DROP TABLE IF EXISTS victorycity;
DROP TABLE IF EXISTS revenue;
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS product;

CREATE TABLE product (
	p_id INT,
	p_name VARCHAR(40),
	p_price INT,
        res_price INT,
	PRIMARY KEY(p_id)
);
CREATE TABLE country (
        c_id INT NOT NULL,
        c_name VARCHAR(30) NOT NULL,
        ipsc INT NOT NULL,
	PRIMARY KEY(c_id)
);
CREATE TABLE purchase (
        p_id INT NOT NULL,
        amount INT NOT NULL,
        c_id INT NOT NULL,
        season_year VARCHAR(20) NOT NULL,
        turn INT NOT NULL,
	FOREIGN KEY(p_id) REFERENCES product(p_id),
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
INSERT INTO country(c_id, c_name, ipsc) VALUES (0, "Germany", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (1, "Soviet Union", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (2, "Japan", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (3, "United States", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (4, "China", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (5, "United Kingdom Europe", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (6, "United Kingdom Pacific", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (7, "Italy", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (8, "ANZAC", 30);
INSERT INTO country(c_id, c_name, ipsc) VALUES (9, "France", 30);

INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (0, "Infantry", 3, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (1, "Artillery", 4, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (2, "Mechanized Infantry", 4, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (3, "Tank", 6, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (4, "AAA", 5, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (5, "Fighter", 6, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (6, "Tactical Bomber", 11, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (7, "Strategic Bomber", 12, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (8, "Battleship", 20, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (9, "Aircraft Carrier", 16, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (10, "Cruiser", 12, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (11, "Destroyer", 8, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (12, "Submarine", 6, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (13, "Transport", 7, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (14, "Major Industrial Company", 30, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (15, "Minor Industrial Company", 12, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (16, "Upgrade Minor Industrial Company", 20, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (17, "Air Base", 15, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (18, "Naval Base", 15, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (19, "Research", 5, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (20, "Repair", 1, NULL);
INSERT INTO product(p_id, p_name, p_price, res_price) VALUES (21, "Airlift", 5, NULL);

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
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (11, "Tokyo", TRUE, "Europe", 2);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (12, "Shanghai", FALSE, "Europe", 2);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (13, "Calcutta", TRUE, "Europe", 6);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (14, "Hong Kong", FALSE, "Europe", 6);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (15, "Manila", FALSE, "Europe", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (16, "San Francisco", FALSE, "Europe", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (17, "Honolulu", FALSE, "Europe", 3);
INSERT INTO victorycity(v_id, v_name, isCapital, side, c_id) VALUES (18, "Sydney", TRUE, "Europe", 8);

INSERT INTO research(res_id, res_name) VALUES (0, "Advanced Artillery");
INSERT INTO research(res_id, res_name) VALUES (1, "Rockets");
INSERT INTO research(res_id, res_name) VALUES (2, "Paratroopers");
INSERT INTO research(res_id, res_name) VALUES (3, "Increased Factory Production");
INSERT INTO research(res_id, res_name) VALUES (4, "War bonds");
INSERT INTO research(res_id, res_name) VALUES (5, "Improved Mechanized Infantry");
INSERT INTO research(res_id, res_name) VALUES (6, "Super Submarines");
INSERT INTO research(res_id, res_name) VALUES (7, "Jet Fighters");
INSERT INTO research(res_id, res_name) VALUES (8, "Radar");
INSERT INTO research(res_id, res_name) VALUES (9, "Improved Shipyards");INSERT INTO research(res_id, res_name) VALUES (0, "Advanced Artillery");
INSERT INTO research(res_id, res_name) VALUES (10, "Long Range Aircraft");
INSERT INTO research(res_id, res_name) VALUES (11, "Heavy Bombers");



