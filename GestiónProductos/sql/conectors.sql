-- Conector --
CREATE OR REPLACE FUNCTION management.products_webapi_constructor (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
		OR NOT p_products ? 'name'
		OR NOT p_products ? 'description'
		OR NOT p_products ? 'stock'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_constructor EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_constructor(
        p_products ->> 'code', 
        p_products ->> 'name', 
        p_products ->> 'description', 
        p_products ->> 'stock'
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_delete_row_by_code_id  (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_delete_row_by_code_id EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_delete_row_by_code_id (
        p_products ->> 'code'
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION management.products_webapi_get_code_id  (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_get_code_id EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_get_code_id(
        p_products ->> 'code'
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_get_name (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'name'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_get_name EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_get_name(
        p_products ->> 'name'
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_get_description (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'description'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_get_description EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_get_description(
        p_products ->> 'description'
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_get_stock (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'stock'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_get_stock EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_get_stock(
        p_products ->> 'stock'
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_set_code_id (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
		OR NOT p_products ? 'name'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_set_code_id EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_set_code_id (
        p_products ->> 'code', 
        p_products ->> 'name' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_set_name (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
		OR NOT p_products ? 'name'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_set_name EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_set_name (
        p_products ->> 'code', 
        p_products ->> 'name' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_set_description (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
		OR NOT p_products ? 'description'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_set_description EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_set_description (
        p_products ->> 'code', 
        p_products ->> 'description' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_set_stock (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
		OR NOT p_products ? 'stock'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_set_stock EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_set_stock (
        p_products ->> 'code', 
        p_products ->> 'stock' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_identify_by_code_id (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_identify_by_code_id EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_identify_by_code_id (
        p_products ->> 'code'  
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

/*
CREATE OR REPLACE FUNCTION management.products_webapi_identify_by_name (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'name'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_identify_by_name EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_identify_by_name (
        p_products ->> 'name' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_identify_by_description (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'description'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_identify_by_description EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_identify_by_description (
        p_products ->> 'description' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_identify_by_stock (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'stock'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_identify_by_stock EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_identify_by_stock (
        p_products ->> 'stock' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;
*/

CREATE OR REPLACE FUNCTION management.products_webapi_lookup_by_code_id (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products  ? 'code'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_lookup_by_code_id EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_lookup_by_code_id (
        p_products ->> 'code'  
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_lookup_by_name (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'name'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_lookup_by_name EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_lookup_by_name (
        p_products ->> 'name' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

/*
CREATE OR REPLACE FUNCTION management.products_webapi_lookup_by_description (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'description'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_lookup_by_description EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_lookup_by_description (
        p_products ->> 'description' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_webapi_lookup_by_stock (
	IN p_products                    jsonb
) RETURNS void AS $$
BEGIN 
	IF NOT p_products ? 'stock'
	THEN 
		RAISE EXCEPTION 'management.products_webapi_management.products_lookup_by_stock EXCEPTION: malformed JSON object';
	END IF;
	
	PERFORM management.products_lookup_by_stock (
        p_products ->> 'stock' 
        );
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;
SET search_path FROM CURRENT;
*/
