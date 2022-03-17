--##### DADOS PARA TESTE #####--

-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (1, 'DF', '70688-290', 'Brasília', 'Setor Noroeste', 'Quadra CRNW 511 Bloco A');
-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (2, 'DF', '71742-002', 'Brasília', 'Asa Norte', 'Quadra EQN 412/413');
-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (3, 'DF', '72548-241', 'Brasília', 'Santa Maria', 'Quadra CL 418 Bloco A');
-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (4, 'DF', '71805-719', 'Brasília', 'Riacho Fundo I', 'Quadra QN 7 Conjunto 19');
-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (5, 'DF', '71994-145', 'Brasília', 'Setor Habitacional Arniqueira', 'Conjunto SHA Conjunto 4 Chácara 23');
-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (6, 'DF', '71880-035', 'Brasília', 'Riacho Fundo II', 'Quadra QN 7C Conjunto 5');
-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (7, 'DF', '71901-210', 'Brasília', 'Norte (Águas Claras)', 'Alameda Gravatá Quadra 301 Conjunto 02');
-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (8, 'DF', '72210-070', 'Brasília', 'Ceilândia Norte (Ceilândia)', 'Quadra QNM 6 Conjunto J');
-- INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (9, 'DF', '70002-901', 'Brasília', 'Asa Norte', 'SBN Quadra 1 Bloco A 19º Andar');
-----------
-- INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('027.994.401-26', 'Bruno Iago Guilherme Pires', '1985-01-15', 'bruno-pires94@zigotto.com.br', '1', 3);
-- INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('750.192.711-10', 'Rosa Clarice da Rocha', '1985-01-15', 'rosaclaricedarocha@ugeda.com.br', '1', 4);
-- INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('195.762.441-88', 'João Emanuel da Paz', '1985-01-15', 'joao-dapaz79@gmai.com', '1', 5);
-- INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('251.189.591-95', 'Cauã Luiz Yago Sales', '1985-01-15', 'caua.luiz.sales@megamega.com.br', '1', 6);
-- INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('043.566.591-04', 'Alexandre Felipe Márcio Peixoto', '1985-01-15', 'alexandre-peixoto78@mktec.com.br', '1', 7);
-- INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('613.501.071-90', 'Bárbara Eloá Pietra Rezende', '1985-01-15', 'barbara-rezende97@redhouse.com.br', '1', 8);
-- INSERT INTO CLIENTE(ClienteId, Nome, DataNasc, Email, Ativo, EnderecoId) VALUES ('226.114.011-87', 'Rodrigo Igor Alves', '1985-01-15', 'rodrigo_alves@sygma.com.br', '1', 9);


-- Clientes do DF

--

-----------
INSERT INTO CATEGORIA(CategoriaId, Categoria, Lugares, MalaPequena, MalaGrande, Carga, TipoDirecao, CambioAT, Extra) VALUES
	-- A Comum
	('A0', 'Compacto', '5', 1, 1, null, null, 0, ''),
	('AE', 'Econômico', '5', 1, 2, null, 'Hidráulica', 0, ''),
	('AEx', 'Econômico Sedan', '5', 2, 2, null, 'Hidráulica', 0, ''),
	('AS', 'Intermediário', '5', 2, 2, null, 'Hidráulica', 0, 'Motor 1.6'),
	('ASt', 'Intermediário AT', '5', 2, 2, null, 'Hidráulica', 1, 'Motor 1.6'),
	-- B Adaptado
	('B', 'Adaptado', '5', 2, 5, null, 'Hidráulica', 1, ''),
	-- G Grande
	('G0', 'Furgão Feio', '2', 0, 0, '700kg', null, 0, ''),
	('GS', 'Furgão Especial', '2', 0, 0, '1000kg', 'Hidráulica', 0, 'Diesel'),
	('GX', 'Minivan', '7', 2, 2, null, 'Hidráulica', 0, ''),
	('GXs', 'Van', '7+', 0, 0, null, 'Hidráulica', 0, 'Diesel'),
	-- E Executivo
	('E', 'Executivo', '5', 2, 3, null, 'Hidráulica', 1, ''),
	('EB', 'Executivo Blindado', '5', 2, 3, null, 'Hidráulica', 1, 'Blindado'),
	('ES', 'Prime', '5', 2, 3, null, 'Elétrica', 1, 'Banco de Couro'),
	-- P Pick-up
	('P0', 'Pick-up', '2', 0, 0, '700kg', null, 0, ''),
	('PS', 'Pick-up Plus', '5', 0, 0, '700kg', null, 0, ''),
	('PX', 'Pick-up de Luxo', '5', 0, 0, '700kg', 'Elétrica', 1, ''),
	('P4', '4x4 Especial', '5', 0, 0, '700kg', 'Hidráulica', 0, 'Diesel,Tração 4x4'),
	-- S Suv
	('S0', 'Suv Compacto', '5', 2, 3, null, 'Hidráulica', 0, ''),
	('S0t', 'Suv Compacto AT', '5', 2, 3, null, 'Hidráulica', 1, ''),
	('SS', 'Suv Especial', '5', 2, 3, null, 'Hidráulica', 1, ''),
	('SX', 'Suv Elite', '7', 2, 3, null, 'Elétrica', 1, 'Banco de Couro,Diesel');
	-- Y Esportivo?

-----------
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES (1, 'Uno Drive 1.0', 'Fiat', null, 'Manual', 2020, 49184.00, 1);
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES (2, 'Mobi 1.0', 'Fiat', 'Hidráulica', 'Manual', 2018, 46656, 1);
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES (3, 'Sandero 1.0', 'Renault', 'Hidráulica', 'Manual', 2020, 53195, 2);
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

INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('043.566.591-04', 5, '2022-03-16', '2022-05-14');
-----------
INSERT INTO PAGAMENTO(PagamentoId, ClienteId, LocacaoId, Valor) VALUES;
--##### /DADOS PARA TESTE/ #####--


--##### PROCEDIMENTOS #####--

-- Cadastra CLIENTE
DELIMITER //
CREATE PROCEDURE CadastraCliente(xNome varchar(40), xClienteId varchar(14), xRg varchar(12), xDataNasc varchar(10), xSexo varchar(10), xEmail varchar(40), xSenha varchar(40), xCep varchar(9), xEndereco varchar(40), xBairro varchar(50), xCidade varchar(30), xUf char(2), xTelefone varchar(20))
	BEGIN
		-- converte DataNasc e Sexo para os formatos padrão
		declare xEnderecoId smallint;

		set xDataNasc = str_to_date(xDataNasc, '%d/%m/%Y');
		set xSexo = left(xSexo, 1);

		-- registrar dados de endereço
		insert into endereco(Cep, Endereco, Bairro, Cidade, Uf)
		values (xCep, xEndereco, xBairro, xCidade, xUf);

		
		select EnderecoId into xEnderecoId from endereco where Cep = xCep;

		insert into cliente(Nome, ClienteId, Rg, DataNasc, Sexo, Email, Senha, Telefone)
		values (xNome, xClienteId, xRg, xDataNasc, xSexo, xEmail, xSenha, xTelefone);

		-- relaciona o cliente com o endereço dele
		update cliente set EnderecoId = xEnderecoId where ClienteId = xClienteId;
	END//
DELIMITER ;
DROP PROCEDURE CadastraCliente;


-- Registra PAGAMENTO
DELIMITER //
CREATE PROCEDURE ValorTotalAluguel(xLocacaoId int, xClienteId varchar(14), xGaragemId int)
	BEGIN
		declare x float;
		declare DataA date;
		declare dataB date;
		declare xModeloId int;

		-- atribui à xModeloId o ModeloId da GaragemId em questão
		select ModeloId into xModeloId from garagem where GaragemId = xGaragemId;
		-- atribui à x o preco de aluguel do modelo
		select PrecoAluguel into x from modelo where ModeloId = xModeloId;
		-- dataA = DataLocacao // dataB = DataRetorno
		select DataLocacao into dataA from locacao where LocacaoId = xLocacaoId;
		select DataRetorno into dataB from locacao where LocacaoId = xLocacaoId;
		-- registra na tabela PAGAMENTO os valores: ClienteId, LocacaoId, Valor.
		insert into pagamento set ClienteId = xClienteId, LocacaoId = xLocacaoId, Valor = x * datediff(DataB, DataA);
	END//
DELIMITER ;
DROP PROCEDURE ValorTotalAluguel;
--##### /PROCEDIMENTOS/ #####--

--##### GATILHOS #####--

-- Registra data de cadastro do CLIENTE
DELIMITER //
CREATE TRIGGER Tr_ClienteDataCadastro BEFORE INSERT ON CLIENTE
	FOR EACH ROW
	BEGIN
		set new.DataCadastro = current_timestamp();
		set new.Ativo = 1;
	END//
DELIMITER ;
DROP TRIGGER Tr_ClienteDataCadastro;

-- Insere o preço de aluguel do MODELO, baseado em seu preço comercial
CREATE TRIGGER Tr_UpdateAluguel BEFORE INSERT ON MODELO -- no Insert
	FOR EACH ROW 
		set new.PrecoAluguel = 0.002 * new.PrecoModelo;
DROP TRIGGER Tr_UpdateAluguel;

CREATE TRIGGER Tr_InsereAluguel BEFORE UPDATE ON MODELO -- no Update
	FOR EACH ROW 
		set new.PrecoAluguel = 0.002 * new.PrecoModelo;
DROP TRIGGER Tr_InsereAluguel;

-- Insere DataInicio e DataFim na tabela GARAGEM quando há locação de um modelo (DataLocacao, DataRetorno)
CREATE TRIGGER Tr_GaragemLocacao AFTER INSERT ON LOCACAO
	FOR EACH ROW
		update garagem set StatusId = 1, DataInicio = new.DataLocacao, DataFim = new.DataRetorno where GaragemId = new.GaragemId;
DROP TRIGGER Tr_GaragemLocacao;


-- Calcula o valor total a pagar Valor = PrecoAluguel * (DataRetorno - DataLocacao)
CREATE TRIGGER Tr_Pagamento AFTER INSERT ON LOCACAO
	FOR EACH ROW
		call ValorTotalAluguel(new.LocacaoId, new.ClienteId, new.GaragemId);
DROP TRIGGER Tr_Pagamento;

--##### /GATILHOS/ #####--



--##### TESTES #####--
SELECT * FROM ENDERECO;
SELECT * FROM CLIENTE;
SELECT * FROM CATEGORIA;
SELECT * FROM MODELO;
SELECT * FROM LOCADORA;
SELECT * FROM GARAGEM;
SELECT * FROM LOCACAO;
SELECT * FROM STATUS;
SELECT * FROM PAGAMENTO;
--##### /TESTES/ #####--