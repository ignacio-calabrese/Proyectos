CREATE OR REPLACE FUNCTION management.products_get_name (
	IN p_management.products             management.products
) RETURNS text AS 
$$
	SELECT p_management.products.name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION management.products_get_description (
	IN p_management.products             management.products
) RETURNS text AS 
$$
	SELECT p_management.products.description;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION management.products_get_stock (
	IN p_management.products             management.products
) RETURNS integer AS 
$$
	SELECT p_management.products.stock;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 