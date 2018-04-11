CREATE TABLE management.products (
    code_id                       serial PRIMARY KEY,
    name                          text NOT NULL,
    description                   text NOT NULL,
    stock                         integer CHECK(stock >= 0)
);