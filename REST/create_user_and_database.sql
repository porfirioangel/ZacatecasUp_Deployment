CREATE DATABASE IF NOT EXISTS zacatecas_up;

CREATE USER IF NOT EXISTS 'zacatecas_up'@'localhost' IDENTIFIED BY 'zacatecas_up';

GRANT ALL PRIVILEGES ON zacatecas_up.* TO 'zacatecas_up'@'localhost';

FLUSH PRIVILEGES;