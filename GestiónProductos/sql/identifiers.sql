-- Identificadores --
CREATE OR REPLACE FUNCTION management.products_identify_by_code_id (
	IN p_code             integer
) RETURNS management.products AS 
$$
	SELECT * FROM management.products WHERE code_id = p_code;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

/*
CREATE OR REPLACE FUNCTION management.products_identify_by_name (
	IN p_name            text
) RETURNS management.products AS 
$$
	SELECT * FROM management.products WHERE name = p_name;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_identify_by_description (
	IN p_description            text
) RETURNS management.products AS 
$$
	SELECT * FROM management.products WHERE description = p_description;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_identify_by_stock (
	IN p_stock            integer
) RETURNS management.products AS 
$$
	SELECT * FROM management.products WHERE stock = p_stock;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;
*/

