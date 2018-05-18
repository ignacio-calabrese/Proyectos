
CREATE OR REPLACE FUNCTION webapi_product_validate (
	IN p_product                  jsonb
) RETURNS boolean AS $$
BEGIN 
	IF NOT p_product ? 'id'
		OR NOT p_product ? 'name'
		OR NOT p_product ? 'description'
		OR NOT p_product ? 'stock'
	THEN
		RETURN FALSE;
	ELSE 
		RETURN TRUE;
	END IF;
END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;


CREATE OR REPLACE FUNCTION webapi_product_create (
	IN p_product                  jsonb
) RETURNS jsonb AS $$
BEGIN 
	IF NOT webapi_product_validate(p_product)
	THEN 
		RAISE EXCEPTION 'webapi_product_create ERROR: malformed JSON object';
	END IF;
	
	RETURN row_to_json(p)::jsonb FROM product (
		p_product ->> 'name',
		p_product ->> 'description',
		(p_product ->> 'stock')::integer
	) p;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
