CREATE OR REPLACE FUNCTION management.products (
    IN p_name    text,
    IN p_description   text,
    IN p_stock  integer
) RETURNS boolean AS $$
DECLARE
    products_count  integer;
BEGIN
    products_count := count(1) FROM management.products WHERE name = p_name;
    IF products_count = 0
    THEN
        INSERT INTO management.products (name, description, stock) VALUES
            (p_name, p_description, p_stock);
        RETURN TRUE;
	ELSE 
		RAISE WARNING 'ERROR: YA EXISTEN EN LA BASE DE DATOS';
		RETURN FALSE;
	 END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;