.phony: clean

CLIENT = psql
FLAGS = -c

all: deploy 

deploy: software.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS gestionproductos" postgres
	$(CLIENT) $(FLAGS) "CREATE DATABASE gestionproductos" postgres
	$(CLIENT) gestionproductos < software.sql
	$(CLIENT) gestionproductos < constructors.sql
	 
software.sql: \
	schema.sql \
	tables_adt.sql \
	constructors.sql \
	delete.sql \
	getters.sql \
	setters.sql\
	identifiers.sql\
	lookups.sql \
	view_all.sql

	touch software.sql
	cat schema.sql >> software.sql
	cat tables_adt.sql >> software.sql
	cat constructors.sql >> software.sql
	cat delete.sql >> software.sql
	cat getters.sql >> software.sql
	cat setters.sql >> software.sql
	cat identifiers.sql >> software.sql
	cat lookups.sql >> software.sql
	cat view_all.sql >> software.sql
	
clean:
	$(RM) software.sql
