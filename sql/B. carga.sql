--##### DADOS PARA TESTE #####--
-----------
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (1, 'DF', '70688-290', 'Brasília', 'Setor Noroeste', 'Quadra CRNW 511 Bloco A');
INSERT INTO ENDERECO(EnderecoId, Uf, Cep, Cidade, Bairro, Endereco) VALUES (2, 'DF', '71742-002', 'Brasília', 'Asa Norte', 'Quadra EQN 412/413');
-----------
INSERT INTO CATEGORIA(CategoriaId, Categoria, Lugares, MalaPequena, MalaGrande, Carga, TipoDirecao, CambioAT, Extra) VALUES
	-- A Comum
	('A0', 'Compacto', '5', 1, 1, null, null, 0, ''),
	('AS', 'Econômico', '5', 1, 2, null, 'Hidráulica', 0, ''),
	('ASx', 'Econômico Sedan', '5', 2, 2, null, 'Hidráulica', 0, ''),
	('AX', 'Intermediário', '5', 2, 2, null, 'Hidráulica', 0, 'Motor 1.6'),
	('AXt', 'Intermediário AT', '5', 2, 2, null, 'Hidráulica', 1, 'Motor 1.6'),
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
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES
	(1, 'Uno 1.0 Drive', 'Fiat', '', 'Manual', 2021, 54830.00, 'A0'),
	(2, 'Mobi 1.0 Easy', 'Fiat', '', 'Manual', 2022, 49301.00, 'A0'),
	(3, 'Kwid 1.0 Zen', 'Renault', '', 'Manual', 2022, 56189.00, 'A0'),
	(4, 'Gol 1.0', 'Volkswagen', '', 'Manual', 2022, 65090.00, 'A0');
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES
	(5, 'Sandero Zen', 'Renault', 'Hidráulica', 'Manual', 2022, 69671.00, 'AS'),
	(6, 'Argo 1.0', 'Fiat', 'Hidráulica', 'Manual', 2022, 69765.00, 'AS'),
	(7, 'Polo 1.0', 'Volkswagen', 'Hidráulica', 'Manual', 2021, 73735.00, 'AS'),
	(8, '208 1.6 Like', 'Peugeot', 'Hidráulica', 'Manual', 2022, 73796.00, 'AS'),
	(9, 'HB20 1.0 Evolution', 'Peugeot', 'Hidráulica', 'Manual', 2022, 74407.00, 'AS'),
	(10, 'Onix 1.0 LT', 'Chevrolet', 'Hidráulica', 'Manual', 2022, 74812.00, 'AS');
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES 
	(11, 'Voyage 1.0', 'Volkswagen', 'Hidráulica', 'Manual', 2022, 70960.00, 'ASx'),
	(12, 'Logan Zen', 'Renault', 'Hidráulica', 'Manual', 2022, 71469.00, 'ASx'),
	(13, 'Prisma 1.4 LTZ', 'Chevrolet', 'Hidráulica', 'Manual', 2019, 71553.00, 'ASx'),
	(14, 'Versa 1.6 Sense', 'Nissan', 'Hidráulica', 'Manual', 2021, 72990.00, 'ASx'),
	(15, 'HB20S 1.6 Vision', 'Hyundai', 'Hidráulica', 'Manual', 2022, 78213.00, 'ASx');
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES 
	(16, 'Cobalt LT 1.4 8V (Flex)', 'Chevrolet', 'Hidráulica', 'Manual', 2021, 67269.00, 'AX'),
	(17, 'Etios Sedan X Plus 1.5 (Flex)', 'Toyota', 'Hidráulica', 'Manual', 2021, 69439.00, 'AX'),
	(18, 'Virtus 1.6 MSI (Flex)', 'Volkswagen', 'Hidráulica', 'Manual', 2020, 76071.00, 'AX');
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES 
	(19, 'Etios Sedan X Plus 1.5 (Flex) (Aut)', 'Toyota', 'Hidráulica', 'Automático', 2021, 79716.00, 'AXt'),
	(20, 'Virtus 1.6 MSI (Flex) (Aut)', 'Volkswagen', 'Hidráulica', 'Automático', 2020, 81650.00, 'AXt'),
	(21, 'HB20S 1.6 Vision (Aut)', 'Chevrolet', 'Hidráulica', 'Automático', 2022, 82097.00, 'AXt');
INSERT INTO MODELO(ModeloId, Modelo, Fabricante, Direcao, Cambio, Ano, PrecoModelo, CategoriaId) VALUES
	(22, 'Ecosport 1.5 SE', 'Ford', 'Hidráulica', 'Manual', 2021, 80069.00, 'S0'),
	(23, 'Ecosport 2.0 Storm 4WD (Aut)', 'Ford', 'Hidráulica', 'Automático', 2021, 106485.00, 'S0t');
-----------
INSERT INTO LOCADORA(LocadoraId, Locadora, EnderecoId) VALUES
	(1, 'Dopler Noroeste', 1),
	(2, 'Dopler Asa Norte', 2);
-----------
INSERT INTO STATUS(StatusId, Status) VALUES
	(0, 'Alugado'),
	(1, 'Disponível'),
	(2, 'Reservado'),
	(3, 'Manutenção');
-----------
INSERT INTO GARAGEM(ModeloId, LocadoraId) VALUES
	(3, 1),
	(4, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(14, 1),
	(15, 1),
	(18, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1);
INSERT INTO GARAGEM(ModeloId, LocadoraId) VALUES
	(1, 2),
	(2, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(11, 2),
	(12, 2),
	(13, 2),
	(16, 2),
	(17, 2),
	(18, 2),
	(19, 2);
	(20, 2);
	(21, 2);
	(22, 2);
-----------
--##### /DADOS PARA TESTE/ #####--