 -- Constructor --
CREATE OR REPLACE FUNCTION management.products_constructor(
    IN p_code      integer, 
    IN p_name    text,
    IN p_description   text,
    IN p_stock  integer
) RETURNS boolean AS $$
DECLARE
    products_count  integer;
BEGIN
    products_count := count(1) FROM management.products WHERE code_id = p_code;
    IF products_count = 0
    THEN
        INSERT INTO management.products(code_id, name, description, stock) VALUES(
            p_code,
            p_name, 
            p_description, 
            p_stock
        );
        
        RETURN TRUE;
	ELSE 
		RAISE WARNING 'ERROR: YA EXISTEN EN LA BASE DE DATOS';
		RETURN FALSE;
	 END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;



