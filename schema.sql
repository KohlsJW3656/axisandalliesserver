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
	p_cost INT,
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
        c_id INT NOT NULL,
        isMajor BOOLEAN,
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

