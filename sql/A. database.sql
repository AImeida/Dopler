CREATE SCHEMA DOPLER;
USE DOPLER;

CREATE TABLE ENDERECO (
	EnderecoId smallint auto_increment PRIMARY KEY,
	Uf char(2),
	Cep varchar(9) unique,
	Cidade varchar(30),
	Bairro varchar(40),
	Endereco varchar(40)
);
CREATE TABLE CLIENTE (
	ClienteId varchar(14) PRIMARY KEY,
	Nome varchar(40) not null,
	Cnh varchar(11),
	DataNasc date,
	DataCadastro timestamp,
	Email varchar(40),
	Ativo boolean,
	EnderecoId smallint,
	FOREIGN KEY (EnderecoId) REFERENCES ENDERECO(EnderecoId)
);
CREATE TABLE CATEGORIA (
	CategoriaId tinyint auto_increment PRIMARY KEY,
	Categoria varchar(20) not null,
	Lugares tinyint,
	MalaPequena tinyint,
	MalaGrande tinyint,
	Carga smallint,
	TipoDirecao varchar(20)
);
CREATE TABLE MODELO (
	ModeloId smallint auto_increment PRIMARY KEY,
	Modelo varchar(30) not null,
	Fabricante varchar(30) not null,
	Direcao varchar(20),
	Cambio varchar(20),
	Ano year,
	PrecoAluguel float,
	PrecoModelo float,
	CategoriaId tinyint,
	UltimoUpdate timestamp,
	Foto blob,
	FOREIGN KEY (CategoriaId) REFERENCES CATEGORIA(CategoriaId)
);
CREATE TABLE LOCADORA (
	LocadoraId tinyint auto_increment PRIMARY KEY,
	Locadora varchar(30) not null,
	EnderecoId smallint,
	FOREIGN KEY (EnderecoId) REFERENCES ENDERECO(EnderecoId)
);
CREATE TABLE GARAGEM (
	GaragemId smallint auto_increment PRIMARY KEY,
	ModeloId smallint,
	LocadoraId tinyint,
	StatusId tinyint,
	DataInicio date,
	DataFim date,
	UltimoUpdate timestamp,
	FOREIGN KEY (ModeloId) REFERENCES MODELO(ModeloId),
	FOREIGN KEY (LocadoraId) REFERENCES LOCADORA(LocadoraId),
	FOREIGN KEY (StatusId) REFERENCES STATUS(StatusId)
);
CREATE TABLE LOCACAO (
	LocacaoId int auto_increment PRIMARY KEY,
	ClienteId varchar(14),
	GaragemId smallint,
	DataLocacao date,
	DataRetorno date,
	UltimoUpdate timestamp,
	FOREIGN KEY (ClienteId) REFERENCES CLIENTE(ClienteId),
	FOREIGN KEY (GaragemId) REFERENCES GARAGEM(GaragemId)
);
CREATE TABLE STATUS (
	StatusId tinyint not null PRIMARY KEY,
	Status enum('Disponível', 'Alugado', 'Reservado', 'Manutenção') unique,
	-- DataInicio date,
	-- DataFim date,
	UltimoUpdate timestamp,
);
CREATE TABLE PAGAMENTO (
	PagamentoId int auto_increment PRIMARY KEY,
	ClienteId varchar(14),
	LocacaoId int,
	Valor float, -- = PrecoAluguel * (Devolucao - Inicio) [MODELO - STATUS]
	FOREIGN KEY (ClienteId) REFERENCES CLIENTE(ClienteId),
	FOREIGN KEY (LocacaoId) REFERENCES LOCACAO(LocacaoId)
);


DROP SCHEMA DOPLER;

--##### DADOS PARA TESTE #####--
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (1, 'DF', '70688-290', 'Brasília', 'Setor Noroeste', 'Quadra CRNW 511 Bloco A');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (2, 'DF', '71742-002', 'Brasília', 'Asa Norte', 'Quadra EQN 412/413');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (3, 'DF', '72548-241', 'Brasília', 'Santa Maria', 'Quadra CL 418 Bloco A');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (4, 'DF', '71805-719', 'Brasília', 'Riacho Fundo I', 'Quadra QN 7 Conjunto 19');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (5, 'DF', '71994-145', 'Brasília', 'Setor Habitacional Arniqueira', 'Conjunto SHA Conjunto 4 Chácara 23');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (6, 'DF', '71880-035', 'Brasília', 'Riacho Fundo II', 'Quadra QN 7C Conjunto 5');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (7, 'DF', '71901-210', 'Brasília', 'Norte (Águas Claras)', 'Alameda Gravatá Quadra 301 Conjunto 02');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (8, 'DF', '72210-070', 'Brasília', 'Ceilândia Norte (Ceilândia)', 'Quadra QNM 6 Conjunto J');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (9, 'DF', '70002-901', 'Brasília', 'Asa Norte', 'SBN Quadra 1 Bloco A 19º Andar');
-----------
INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('027.994.401-26', 'Bruno Iago Guilherme Pires', '1985-01-15', 'bruno-pires94@zigotto.com.br', '1', 3);
INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('750.192.711-10', 'Rosa Clarice da Rocha', '1985-01-15', 'rosaclaricedarocha@ugeda.com.br', '1', 4);
INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('195.762.441-88', 'João Emanuel da Paz', '1985-01-15', 'joao-dapaz79@gmai.com', '1', 5);
INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('251.189.591-95', 'Cauã Luiz Yago Sales', '1985-01-15', 'caua.luiz.sales@megamega.com.br', '1', 6);
INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('043.566.591-04', 'Alexandre Felipe Márcio Peixoto', '1985-01-15', 'alexandre-peixoto78@mktec.com.br', '1', 7);
INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('613.501.071-90', 'Bárbara Eloá Pietra Rezende', '1985-01-15', 'barbara-rezende97@redhouse.com.br', '1', 8);
INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('226.114.011-87', 'Rodrigo Igor Alves', '1985-01-15', 'rodrigo_alves@sygma.com.br', '1', 9);
-----------
INSERT INTO CATEGORIA(CategoriaId, Categoria, Lugares, MalaPequena, MalaGrande, Carga, TipoDirecao) VALUES (1, 'Compacto', 5, 1, 1, null, null);
INSERT INTO CATEGORIA(CategoriaId, Categoria, Lugares, MalaPequena, MalaGrande, Carga, TipoDirecao) VALUES (2, 'Econômico', 5, 1, 2, null, 'Hidráulica');
INSERT INTO CATEGORIA(CategoriaId, Categoria, Lugares, MalaPequena, MalaGrande, Carga, TipoDirecao) VALUES (3, 'Econômico Sedan', 5, 2, 2, null, 'Hidráulica');
INSERT INTO CATEGORIA(CategoriaId, Categoria, Lugares, MalaPequena, MalaGrande, Carga, TipoDirecao) VALUES (4, 'Intermediário', 5, 2, 2, null, 'Hidráulica');
-----------
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES (1, 'Uno Drive 1.0', 'Fiat', null, 'Manual', 2020, 49184.00, 1);
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES (2, 'Mobi 1.0', 'Fiat', 'Hidráulica', 'Manual', 2018, 46656, 1);
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES (3, 'Sandero 1.0', 'Renault', 'Hidráulica', 'Manual', 2020, 53.195, 2);
-----------
INSERT INTO LOCADORA(LocadoraId, Locadora, EnderecoId) VALUES (1, 'Dopler Noroeste', 1);
INSERT INTO LOCADORA(LocadoraId, Locadora, EnderecoId) VALUES (2, 'Dopler Asa Norte', 2);
-----------
INSERT INTO STATUS(StatusId, Status) VALUES(0, 'Alugado');
INSERT INTO STATUS(StatusId, Status) VALUES(1, 'Disponível');
INSERT INTO STATUS(StatusId, Status) VALUES(2, 'Reservado');
INSERT INTO STATUS(StatusId, Status) VALUES(3, 'Manutenção');
-----------
INSERT INTO GARAGEM(GaragemId, ModeloId, LocadoraId) VALUES(1, 1, 1);
INSERT INTO GARAGEM(GaragemId, ModeloId, LocadoraId) VALUES(2, 2, 1);
INSERT INTO GARAGEM(GaragemId, ModeloId, LocadoraId) VALUES(3, 3, 1);
INSERT INTO GARAGEM(GaragemId, ModeloId, LocadoraId) VALUES(4, 1, 2);
INSERT INTO GARAGEM(GaragemId, ModeloId, LocadoraId) VALUES(5, 2, 2);
INSERT INTO GARAGEM(GaragemId, ModeloId, LocadoraId) VALUES(6, 3, 2);
-----------
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('027.994.401-26', 1, '2022-03-15', '2022-03-20');
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('750.192.711-10', 2, '2022-03-24', '2022-04-02');
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('195.762.441-88', 3, '2022-04-01', '2022-04-10');
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('251.189.591-95', 4, '2022-03-16', '2022-05-14');
BEGIN TRANSACTION
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('043.566.591-04', 5, '2022-03-16', '2022-05-14');
ROLLBACK;
-----------
INSERT INTO PAGAMENTO(PagamentoId, ClienteId, LocacaoId, Valor) VALUES;
--##### /DADOS PARA TESTE/ #####--


--##### GATILHOS #####--
-- Insere o preço de aluguel do modelo, baseado em seu preço comercial
CREATE TRIGGER Tr_PrecoAluguel BEFORE INSERT ON MODELO 
FOR EACH ROW set new.PrecoAluguel = 0.002 * new.PrecoModelo;
DROP TRIGGER Tr_PrecoAluguel;

-- Insere DataInicio e DataFim na tabela GARAGEM quando há locação de um modelo (DataLocacao, DataRetorno)
CREATE TRIGGER Tr_GaragemLocacao AFTER INSERT ON LOCACAO
FOR EACH ROW
	update garagem set StatusId = 1, DataInicio = new.DataLocacao, DataFim = new.DataRetorno where GaragemId = new.GaragemId;
DROP TRIGGER Tr_GaragemLocacao;

-- Calcula o valor total a pagar Valor = PrecoAluguel * (DataRetorno - DataLocacao)
CREATE TRIGGER Tr_Pagamento AFTER INSERT ON LOCACAO
FOR EACH ROW
	insert into pagamento set ClienteId = new.ClienteId, LocacaoId = new.LocacaoId, Valor = ;
DROP TRIGGER Tr_Pagamento; 

--##### /GATILHOS/ #####--

--##### TESTES #####--
SELECT * FROM ENDERECO;
SELECT * FROM MODELO;
--##### /TESTES/ #####--