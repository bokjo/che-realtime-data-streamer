CREATE USER 'che'@'%' IDENTIFIED WITH mysql_native_password BY 'che';
CREATE USER 'debezium'@'%' IDENTIFIED WITH mysql_native_password BY 'dbz';
CREATE USER 'replicator'@'%' IDENTIFIED BY 'replpass';

GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT  ON *.* TO 'debezium';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'replicator';

CREATE DATABASE ecommerce;

GRANT SELECT, INSERT, UPDATE, DELETE ON ecommerce.* TO che;
GRANT ALL PRIVILEGES ON ecommerce.* TO 'debezium'@'%';

USE ecommerce;

CREATE TABLE products (
        id INT PRIMARY KEY,
        name VARCHAR(50),
        description VARCHAR(250),
        create_ts timestamp DEFAULT CURRENT_TIMESTAMP,
        update_ts timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO products (id, name, description) VALUES (1, 'Charger', 'USB Charger');
INSERT INTO products (id, name, description) VALUES (2, 'iPad', 'iPad AIR');

CREATE TABLE attributes_kv (
        id INT PRIMARY KEY,
        attribute_id INT NOT NULL,
        attribute INT NOT NULL,
        create_ts timestamp DEFAULT CURRENT_TIMESTAMP,
        update_ts timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO attributes_kv (id, attribute_id, attribute) VALUES (1, 1, 1);
INSERT INTO attributes_kv (id, attribute_id, attribute) VALUES (2, 1, 5);
INSERT INTO attributes_kv (id, attribute_id, attribute) VALUES (3, 1, 7);
INSERT INTO attributes_kv (id, attribute_id, attribute) VALUES (4, 2, 5);
INSERT INTO attributes_kv (id, attribute_id, attribute) VALUES (5, 2, 4);

CREATE TABLE attributes (
        id INT PRIMARY KEY,
        description VARCHAR(250),
        create_ts timestamp DEFAULT CURRENT_TIMESTAMP,
        update_ts timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO attributes (id, description) VALUES (1, 'blue');
INSERT INTO attributes (id, description) VALUES (2, 'usb');
INSERT INTO attributes (id, description) VALUES (3, 'usb-c');
INSERT INTO attributes (id, description) VALUES (4, 'white');
INSERT INTO attributes (id, description) VALUES (5, 'apple');
INSERT INTO attributes (id, description) VALUES (6, 'samsung');
INSERT INTO attributes (id, description) VALUES (7, '5 cm');