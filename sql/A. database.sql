CREATE SCHEMA DOPLER;
USE DOPLER;

CREATE TABLE CATEGORIA (
	CategoriaId int auto_increment PRIMARY KEY,
	Categoria varchar(20) not null,
	Lugares int,
	MalaPequena int,
	MalaGrande int,
	Carga int,
	TipoDirecao varchar(20)
);
CREATE TABLE MODELO (
	ModeloId int auto_increment PRIMARY KEY,
	Modelo varchar(30) not null,
	Fabricante varchar(30) not null,
	Direcao varchar(20),
	Cambio varchar(20),
	Ano int,
	Status enum('Disponível', 'Alugado', 'Reservado', 'Manutenção') not null,
	CategoriaId int,
	FOREIGN KEY (CategoriaId) REFERENCES CATEGORIA(CategoriaId)
);
CREATE TABLE PRECO (
	ModeloId int auto_increment PRIMARY KEY,
	PrecoAluguel float,
	PrecoModelo float,
	FOREIGN KEY (ModeloId) REFERENCES MODELO(ModeloId)
);
CREATE TABLE CLIENTE (
	ClienteId varchar(14) PRIMARY KEY,
	Nome varchar(40) not null,
	DataNasc date,
	DataCadastro date
);
CREATE TABLE LUGAR (
	LugarId int auto_increment PRIMARY KEY,
	Uf char(2),
	Cep varchar(9),
	Cidade varchar(30),
	Bairro varchar(30),
	Lugar varchar(30)
);
CREATE TABLE LOCACAO (
	LocacaoId int auto_increment PRIMARY KEY,
	Info text,
	ClienteId varchar(14),
	ModeloId int,
	LugarId int,
	Inicio date,
	Devolucao date,
	PrecoTotal float, -- = PrecoAluguel * (Devolucao - Inicio)
	FOREIGN KEY (ClienteId) REFERENCES CLIENTE(ClienteId),
	FOREIGN KEY (ModeloId) REFERENCES PRECO(ModeloId),
	FOREIGN KEY (LugarId) REFERENCES LUGAR(LugarId)
);

DROP SCHEMA DOPLER;

-- ALGUNS DADOS PARA TESTE
INSERT INTO CATEGORIA VALUES 
	(1, 'Compacto', 5, 1, 1, null, null),
	(2, 'Econômico', 5, 1, 2, null, 'Hidráulica'),
	(3, 'Econômico Sedan', 5, 2, 2, null, 'Hidráulica'),
	(4, 'Intermediário', 5, 2, 2, null, 'Hidráulica');
INSERT INTO MODELO VALUES (1, 'Uno Drive 1.0 (Flex)', 'Fiat', null, 'Manual', 2020, 'Disponível', 1);
INSERT INTO MODELO VALUES (2, 'Mobi 1.0', 'Fiat', 'Hidráulica', 'Manual', 2018, 'Disponível', 1);
INSERT INTO MODELO VALUES (3, 'Sandero 1.0', 'Renault', 'Hidráulica', 'Manual', 2020, 'Disponível', 2);
INSERT INTO PRECO VALUES (1, '140.00', '480000'), (2, '165.00', '540000'), (3, '180.00', '660000');
INSERT INTO CLIENTE VALUES ('066.355.941-32', 'Satoshi Nakamoto', '1998-06-23', '2022-03-13');
INSERT INTO LUGAR VALUES (1, 'DF', '72465-370', 'Brasília', 'Gama', 'Dopler Gama');
INSERT INTO LOCACAO VALUES;

-- TESTES
SELECT * FROM CATEGORIA;
SELECT * FROM MODELO;
SELECT * FROM PRECO;
SELECT * FROM CLIENTE;
SELECT * FROM LUGAR;
SELECT * FROM LOCACAO;