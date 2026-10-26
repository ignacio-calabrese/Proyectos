
CREATE TABLE product (
	id                            serial PRIMARY KEY,
	name                          text NOT NULL UNIQUE,
	description                    text,
	stock                         integer NOT NULL CHECK (stock >= 0) DEFAULT 0
);
