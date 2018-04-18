-- Borrado--
CREATE OR REPLACE FUNCTION management.products_delete_row_by_code_id (
	IN p_code             integer
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM management.products WHERE code_id = p_code)
	THEN 
		DELETE FROM management.products WHERE code_id = p_code;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'La fila a eliminar NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;

