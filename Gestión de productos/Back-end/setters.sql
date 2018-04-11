CREATE OR REPLACE FUNCTION management.products_set_name (
	IN p_management.products             management.products,
	IN p_name             text
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM management.products a WHERE a = p_management.products)
	THEN 
		UPDATE management.products SET name = p_name
			WHERE code_id = p_management.products.code_id;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'El id ingresado NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_set_description (
	IN p_management.products             management.products,
	IN p_description             text
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM management.products a WHERE a = p_management.products)
	THEN 
		UPDATE management.products SET description = p_description
			WHERE code_id = p_management.products.code_id;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'El id ingresado NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_set_stock (
	IN p_management.products             management.products,
	IN p_stock           integer
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM management.products a WHERE a = p_management.products)
	THEN 
		UPDATE management.products SET stock = p_stock
			WHERE code_id = p_management.products.code_id;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'El id ingresado NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;