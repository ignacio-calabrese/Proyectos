.phony: clean

CLIENT = psql
FLAGS = -c

all: deploy 

deploy: software.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS gestionproductos" postgres
	$(CLIENT) $(FLAGS) "CREATE DATABASE gestionproductos" postgres
	# $(CLIENT) gestionproductos < software.sql
	# $(CLIENT) gestionproductos < constructors.sql
	 
	$(CLIENT) gestionproductos < schema.sql 
	$(CLIENT) gestionproductos < tables_adt.sql 
	$(CLIENT) gestionproductos < conectors.sql 
	$(CLIENT) gestionproductos < delete.sql 
	$(CLIENT) gestionproductos < getters.sql 
	$(CLIENT) gestionproductos < setters.sql
	$(CLIENT) gestionproductos < identifiers.sql
	$(CLIENT) gestionproductos < lookups.sql 
	$(CLIENT) gestionproductos < view_all.sql 
	$(CLIENT) gestionproductos <constructors.sql 
	
software.sql: \
	schema.sql \
	tables_adt.sql \
	conectors.sql \
	delete.sql \
	getters.sql \
	setters.sql\
	identifiers.sql\
	lookups.sql \
	view_all.sql \
	constructors.sql 

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
	cat conectors.sql >> software.sql
	
clean:
	$(RM) software.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS gestionproductos" postgres
