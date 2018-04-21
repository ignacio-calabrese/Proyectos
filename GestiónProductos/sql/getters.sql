-- Getters --
CREATE OR REPLACE FUNCTION management.products_get_code_id (
	IN p_products	management.products
) RETURNS integer AS 
$$
	SELECT p_products.code_id;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION management.products_get_name (
	IN p_products	management.products
) RETURNS text AS 
$$
	SELECT p_products.name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION management.products_get_description (
	IN p_products	management.products
) RETURNS text AS 
$$
	SELECT p_products.description;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION management.products_get_stock (
	IN p_products	management.products
) RETURNS integer AS 
$$
	SELECT p_products.stock;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

