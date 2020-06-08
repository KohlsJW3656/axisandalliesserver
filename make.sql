DROP DATABASE IF EXISTS axisandallies;
DROP USER IF EXISTS aaUser@localhost;

CREATE DATABASE axisandallies CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER aaUser@localhost IDENTIFIED BY 'wQynVfAg1$';
GRANT ALL PRIVILEGES ON axisandallies.* TO aaUser@localhost;