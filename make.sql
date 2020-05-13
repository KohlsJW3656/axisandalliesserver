
DROP DATABASE IF EXISTS axisandallies;
DROP USER IF EXISTS axisandallies@localhost;
CREATE DATABASE axisandallies CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER axisandallies@localhost IDENTIFIED BY '@107515';
GRANT ALL PRIVILEGES ON axisandallies.* TO axisandallies@localhost;
