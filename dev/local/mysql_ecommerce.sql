SELECT ID, NAME, DESCRIPTION FROM products LIMIT 5;

SELECT ID, ATTRIBUTE FROM attributes_kv LIMIT 5;

SELECT ID, DESCRIPTION FROM attributes LIMIT 5;

SELECT p.id AS product_id, p.name AS product_name, p.description AS product_description,
       a.id AS attribute_id, a.description AS attribute_description
  FROM `attributes` a
 RIGHT JOIN attributes_kv ak 
    ON a.id = ak.`attribute`
 INNER JOIN products p 
    ON ak.id = p.id     
;

INSERT INTO products (ID, NAME, DESCRIPTION) VALUES (12,'Test1','New1');
INSERT INTO products (ID, NAME, DESCRIPTION) VALUES (13,'Test2','New2');
INSERT INTO products (ID, NAME, DESCRIPTION) VALUES (14,'Test3','New3');



INSERT INTO attributes (ID, DESCRIPTION) VALUES (12,"TEST1");
INSERT INTO attributes (ID, DESCRIPTION) VALUES (13,"TEST2");
INSERT INTO attributes (ID, DESCRIPTION) VALUES (14,"TEST3");
INSERT INTO attributes (ID, DESCRIPTION) VALUES (15,"TEST5");
INSERT INTO attributes (ID, DESCRIPTION) VALUES (16,"TEST6");

INSERT INTO attributes_kv (ID, ATTRIBUTE_ID, ATTRIBUTE) VALUES (12,3,7);
INSERT INTO attributes_kv (ID, ATTRIBUTE_ID, ATTRIBUTE) VALUES (13,2,8);
INSERT INTO attributes_kv (ID, ATTRIBUTE_ID, ATTRIBUTE) VALUES (14,3,3);