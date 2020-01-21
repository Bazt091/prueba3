	CREATE DATABASE prueba
	;
	
	CREATE TABLE customers(
	id INT PRIMARY KEY,
	name VARCHAR(15),
	rut INT,
	direction VARCHAR(30))
	;

	INSERT INTO customers VALUES ('101','Bio Mundo','76314578','Suecia 408  Ñuñoa');
	INSERT INTO customers VALUES ('102','CMK','73242199','Antonio Bellet 444 Providencia');
	INSERT INTO customers VALUES ('103','Synthon','70169820','Lira 4545  Santiago Centro');
	INSERT INTO customers VALUES ('104','Red Farma','67097441','Arturo Pratt 787  Rancagua');
	INSERT INTO customers VALUES ('105','UC Christus','64025062','Marcoleta 308  Santiago Centro');

	CREATE TABLE products_category(
	id INT PRIMARY KEY,
	name VARCHAR(12),
	description VARCHAR(50))
	;

	INSERT INTO products_category VALUES ('1','Medicamentos','para tratar enfermedades');
	INSERT INTO products_category VALUES ('2','Suplementos','Para complementar alimentación');
	INSERT INTO products_category VALUES ('3','Insumos','Para tratamiento de heridas');

	CREATE TABLE products(
	cod INT PRIMARY KEY,
	name VARCHAR(12),
	description VARCHAR(50),
	unit_cost INT)
	;

	INSERT INTO products VALUES ('1','paracetamol','para dolores varios','300');
	INSERT INTO products VALUES ('2','ibuprofeno','para dolores musculares','350');
	INSERT INTO products VALUES ('3','metformina','para la diabetes','400');
	INSERT INTO products VALUES ('4','clonazepan','para drogarse','450');
	INSERT INTO products VALUES ('5','gasa','cubrir heridas','30');
	INSERT INTO products VALUES ('6','jeringa','para inyecciones','40');
	INSERT INTO products VALUES ('7','vitaminas','para descompensaciones','1000');
	INSERT INTO products VALUES ('8','calcio','para los huesos','1200');

	CREATE TABLE bill(
 	num_invoice INT PRIMARY KEY,
	name VARCHAR(12),
	date VARCHAR(30),
	subtotal INT,
	iva INT,
	total_cost INT)
	;

	INSERT INTO bill VALUES ('10001','Bio Mundo','15/12/18','16200','3078','19278');
	INSERT INTO bill VALUES ('10002','Bio Mundo','16/12/18','11070','2104','13174');
	INSERT INTO bill VALUES ('10003','CMK','17/12/18','27630','5250','32880');
	INSERT INTO bill VALUES ('10004','CMK','18/12/18','6160','1171','7331');
	INSERT INTO bill VALUES ('10005','CMK','19/12/18','31860','6054','37914');
	INSERT INTO bill VALUES ('10006','Synthon','20/12/18','23000','4370','27370');
	INSERT INTO bill VALUES ('10007','Red Farma','21/12/18','24750','4703','29453');
	INSERT INTO bill VALUES ('10008','Red Farma','22/12/18','49100','9329','58429');
	INSERT INTO bill VALUES ('10009','Red Farma','23/12/18','93000','17670','110670');
	INSERT INTO bill VALUES ('10010','Red Farma','24/12/18','990','189','1179');

	CREATE TABLE products_list(
	num_invoice INT,
	cod INT,
	name VARCHAR(12),
	unit_cost INT,
	quantity INT,
	total_cost INT,
	FOREIGN KEY (num_invoice) REFERENCES bill(num_invoice),
	FOREIGN KEY (cod) REFERENCES products(cod))
	;

	INSERT INTO products_list VALUES ('10001','1','parecetamol','300','10','3000');
	INSERT INTO products_list VALUES ('10001','8','calcio','1200','11','13200');
	INSERT INTO products_list VALUES ('10002','3','metformina','400','12','4800');
	INSERT INTO products_list VALUES ('10002','4','clonazepan','450','13','5850');
	INSERT INTO products_list VALUES ('10002','5','gasa','30','14','420');
	INSERT INTO products_list VALUES ('10003','4','clonazepan','450','15','6750');
	INSERT INTO products_list VALUES ('10003','5','gasa','30','16','480');
	INSERT INTO products_list VALUES ('10003','8','calcio','1200','17','20400');
	INSERT INTO products_list VALUES ('10004','1','parecetamol','300','18','5400');
	INSERT INTO products_list VALUES ('10004','6','jeringa','40','19','760');
	INSERT INTO products_list VALUES ('10005','1','parecetamol','300','20','6000');
	INSERT INTO products_list VALUES ('10005','8','calcio','1200','21','25200');
	INSERT INTO products_list VALUES ('10005','5','gasa	30','22','660');
	INSERT INTO products_list VALUES ('10006','7','vitaminas','1000','23','23000');
	INSERT INTO products_list VALUES ('10007','7','vitaminas','1000','24','24000');
	INSERT INTO products_list VALUES ('10007','5','gasa	30','25','750');
	INSERT INTO products_list VALUES ('10008','8','calcio','1200','26','31200');
	INSERT INTO products_list VALUES ('10008','1','parecetamol','300','27','8100');
	INSERT INTO products_list VALUES ('10008','2','ibuprofeno','350','28','9800');
	INSERT INTO products_list VALUES ('10009','8','calcio','1200','29','34800');
	INSERT INTO products_list VALUES ('10009','2','ibuprofeno','350','30','10500');
	INSERT INTO products_list VALUES ('10009','1','parecetamol','300','31','9300');
	INSERT INTO products_list VALUES ('10009','7','vitaminas','1200','32','38400');
	INSERT INTO products_list VALUES ('10010','5','gasa','30','33','990');

	SELECT * FROM bill WHERE total_cost = (SELECT MAX (total_cost) FROM bill);
	SELECT * FROM bill WHERE total_cost > 100;
	SELECT * FROM products_list WHERE cod = '6';
	
