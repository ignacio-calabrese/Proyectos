-- Tablas --
CREATE TABLE management.products (
    code_id                       integer PRIMARY KEY CHECK(code_id > 0),
    name                          text NOT NULL,
    description                   text NOT NULL,
    stock                         integer CHECK(stock >= 0)
);

