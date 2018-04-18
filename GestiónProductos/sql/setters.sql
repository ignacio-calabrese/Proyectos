-- Setters --
CREATE OR REPLACE FUNCTION management.products_set_code_id (
	IN p_code             integer,
	IN p_name             text
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM management.products WHERE name = p_name)
	THEN 
		UPDATE management.products SET code_id = p_code
			WHERE name = p_name;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'El id ingresado NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_set_name (
	IN p_code            integer,
	IN p_name             text
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM management.products WHERE code_id  = p_code)
	THEN 
		UPDATE management.products SET name = p_name
			WHERE code_id = p_code;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'El id ingresado NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_set_description (
	IN p_code             integer,
	IN p_description             text
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM management.products WHERE code_id  = p_code)
	THEN 
		UPDATE management.products SET description = p_description
			WHERE code_id = p_code;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'El id ingresado NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_set_stock (
	IN p_code              integer,
	IN p_stock           integer
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM management.products WHERE code_id  = p_code)
	THEN 
		UPDATE management.products SET stock = p_stock
			WHERE code_id = p_code;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'El id ingresado NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;

