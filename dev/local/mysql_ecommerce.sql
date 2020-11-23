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