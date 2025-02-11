ALTER USER 'root'@'localhost' IDENTIFIED BY 'sqlrootpass';

CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER IF NOT EXISTS 'lsabatie'@'%' IDENTIFIED BY 'sqlpass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'lsabatie'@'%';

FLUSH PRIVILEGES;