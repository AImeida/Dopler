CREATE SCHEMA DOPLER;
USE DOPLER;

CREATE TABLE ENDERECO (
	EnderecoId smallint auto_increment PRIMARY KEY,
	Uf char(2),
	Cep varchar(9) unique,
	Cidade varchar(30),
	Bairro varchar(50),
	Endereco varchar(40)
);
CREATE TABLE CLIENTE (
	ClienteId varchar(14) not null PRIMARY KEY, -- Cpf
	Rg varchar(12),
	Nome varchar(40) not null,
	-- Cnh varchar(11) not null unique, -- Cnh como PRIMARY KEY?
	DataNasc date,
	Sexo char(1),
	Telefone varchar(20)
	Email varchar(40),
	EnderecoId smallint,
	DataCadastro timestamp,
	Senha varchar(40),
	Ativo boolean default 1,
	FOREIGN KEY (EnderecoId) REFERENCES ENDERECO(EnderecoId)
);
CREATE TABLE CATEGORIA (
	CategoriaId varchar(3) PRIMARY KEY, -- convenção de letras (A, B, SX)
	Categoria varchar(20) not null,
	Lugares enum('2', '5', '7', '7+'),
	MalaPequena tinyint,
	MalaGrande tinyint,
	Carga boolean,
	TipoDirecao enum('', 'Hidráulica', 'Elétrica'),
	CambioAT boolean,
	Extra set('Motor 1.6', 'Diesel', 'Banco de Couro', 'Tração 4x4', 'Blindado')
);
CREATE TABLE MODELO (
	ModeloId smallint auto_increment PRIMARY KEY,
	Modelo varchar(40) not null,
	Fabricante varchar(30) not null,
	Direcao enum('', 'Hidráulica', 'Elétrica'),
	Cambio enum('Manual', 'Automático'),
	Ano year,
	PrecoAluguel float,
	PrecoModelo float,
	CategoriaId varchar(3),
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
CREATE TABLE STATUS (
	StatusId tinyint not null PRIMARY KEY,
	Status enum('Disponível', 'Alugado', 'Reservado', 'Manutenção') unique
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
CREATE TABLE PAGAMENTO (
	PagamentoId int auto_increment PRIMARY KEY,
	ClienteId varchar(14),
	LocacaoId int,
	Valor float, -- = PrecoAluguel * (Devolucao - Inicio) [MODELO - STATUS]
	FOREIGN KEY (ClienteId) REFERENCES CLIENTE(ClienteId),
	FOREIGN KEY (LocacaoId) REFERENCES LOCACAO(LocacaoId)
);

drop schema dopler;