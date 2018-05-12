.phony: clean

CLIENT = psql
FLAGS = -c

all: deploy 

deploy: software.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS gestionproductos" postgres
	$(CLIENT) $(FLAGS) "CREATE DATABASE gestionproductos" postgres
	$(CLIENT) gestionproductos < software.sql
	
software.sql: \
	product.ddl \
	product.sql \
	webapi_product.sql

	touch software.sql
	cat product.ddl >> software.sql
	cat product.sql >> software.sql
	cat webapi_product.sql >> software.sql
	
clean:
	$(RM) software.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS gestionproductos" postgres
