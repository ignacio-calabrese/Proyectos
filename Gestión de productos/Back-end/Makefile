.phony: clean

CLIENT = psql
FLAGS = -c

all: deploy 

deploy: software.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS gestionproductos" postgres
	$(CLIENT) $(FLAGS) "CREATE DATABASE gestionproductos" postgres
	$(CLIENT) gestionproductos < software.sql
	
software.sql: \
	tables_adt.sql \
	constructors.sql \
	functions.sql \
	getters.sql \
	setters.sql\
	identifiers.sql\
	lookups.sql
	
	touch software.sql
	cat tables_adt.sql >> software.sql
	cat constructors.sql >> software.sql
	cat functions.sql >> software.sql
	cat getters.sql >> software.sql
	cat setters.sql >> software.sql
	cat identifiers.sql >> software.sql
	cat lookups.sql >> software.sql
	
clean:
	$(RM) software.sql