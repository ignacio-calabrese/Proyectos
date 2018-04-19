-- Conector --
CREATE OR REPLACE FUNCTION management.products_webapi_create (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
		OR NOT p_products ? 'name'
		OR NOT p_products ? 'description'
		OR NOT p_products ? 'stock'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_create EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM products(
        p_products ->> 'code', 
        p_products ->> 'name', 
        p_products ->> 'description', 
        p_products ->> 'stock'
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;
