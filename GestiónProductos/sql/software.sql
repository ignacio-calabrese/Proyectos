-- Esquema --
CREATE SCHEMA management;

-- Tablas --
CREATE TABLE management.products (
    code_id                       integer PRIMARY KEY CHECK(code_id > 0),
    name                          text NOT NULL,
    description                   text NOT NULL,
    stock                         integer CHECK(stock >= 0)
);

﻿ -- Constructor --
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

-- Getters --
CREATE OR REPLACE FUNCTION management.products_get_code_id (
	IN p_products	management.products
) RETURNS integer AS 
$$
	SELECT p_products.code_id;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION management.products_get_name (
	IN p_products	management.products
) RETURNS text AS 
$$
	SELECT p_products.name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION management.products_get_description (
	IN p_products	management.products
) RETURNS text AS 
$$
	SELECT p_products.description;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE OR REPLACE FUNCTION management.products_get_stock (
	IN p_products	management.products
) RETURNS integer AS 
$$
	SELECT p_products.stock;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

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

-- Identificadores --
CREATE OR REPLACE FUNCTION management.products_identify_by_code_id (
	IN p_code             integer
) RETURNS management.products AS 
$$
	SELECT * FROM management.products WHERE code_id  = p_code;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

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


-- Bùsquedas --
CREATE OR REPLACE FUNCTION management.products_lookup_by_code_id (
	IN p_code             integer
) RETURNS SETOF management.products AS 
$$
	SELECT * FROM management.products WHERE code_id  = p_code;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_lookup_by_name (
	IN p_name            text
) RETURNS SETOF management.products AS 
$$
	SELECT * FROM management.products WHERE name = p_name;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_lookup_by_description (
	IN p_description            text
) RETURNS SETOF management.products AS 
$$
	SELECT * FROM management.products WHERE description = p_description;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

CREATE OR REPLACE FUNCTION management.products_lookup_by_stock (
	IN p_stock            integer
) RETURNS SETOF management.products AS 
$$
	SELECT * FROM management.products WHERE stock = p_stock;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;

-- Vista completa --
CREATE OR REPLACE VIEW management.vw_select_all AS
	SELECT * FROM management.products; 

	
