--##### PROCEDIMENTOS #####--
-- Cadastra CLIENTE
DELIMITER //
CREATE PROCEDURE CadastraCliente(xNome varchar(40), xClienteId varchar(14), xRg varchar(12), xDataNasc varchar(10), xSexo varchar(10), xEmail varchar(60), xSenha varchar(40), xCep varchar(9), xEndereco varchar(40), xBairro varchar(60), xCidade varchar(30), xUf char(2), xTelefone varchar(20))
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
-- DROP PROCEDURE CadastraCliente;

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
-- DROP PROCEDURE ValorTotalAluguel;
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
-- DROP TRIGGER Tr_ClienteDataCadastro;

-- Insere o preço de aluguel do MODELO, baseado em seu preço comercial
CREATE TRIGGER Tr_UpdateAluguel BEFORE INSERT ON MODELO -- no Insert
	FOR EACH ROW 
		set new.PrecoAluguel = 0.0021 * new.PrecoModelo;
-- DROP TRIGGER Tr_UpdateAluguel;

CREATE TRIGGER Tr_InsereAluguel BEFORE UPDATE ON MODELO -- no Update
	FOR EACH ROW 
		set new.PrecoAluguel = 0.0021 * new.PrecoModelo;
-- DROP TRIGGER Tr_InsereAluguel;

-- Define Status de aluguel em GARAGEM quando há LOCAÇÃO de um modelo, e insere as datas de aluguel na tabela (DataLocacao, DataRetorno)
CREATE TRIGGER Tr_Locacao AFTER INSERT ON LOCACAO
	FOR EACH ROW
		update garagem set StatusId = 2, DataInicio = new.DataLocacao, DataFim = new.DataRetorno where GaragemId = new.GaragemId;
-- DROP TRIGGER Tr_Locacao;

CREATE TRIGGER Tr_Pagamento AFTER INSERT ON LOCACAO
	FOR EACH ROW
		call ValorTotalAluguel(new.LocacaoId, new.ClienteId, new.GaragemId);
-- DROP TRIGGER Tr_Pagamento;

-- Registra data de atualização do MODELO
CREATE TRIGGER Tr_UltimoUpdateModelo1 BEFORE INSERT ON MODELO
	FOR EACH ROW
		set new.UltimoUpdate = current_timestamp();
-- DROP TRIGGER Tr_UltimoUpdateModelo1;
CREATE TRIGGER Tr_UltimoUpdateModelo2 BEFORE UPDATE ON MODELO
	FOR EACH ROW
		set new.UltimoUpdate = current_timestamp();
-- DROP TRIGGER Tr_UltimoUpdateModelo2;

-- Registra data de atualização em GARAGEM
CREATE TRIGGER Tr_UltimoUpdateGaragem1 BEFORE INSERT ON GARAGEM
	FOR EACH ROW
		set new.UltimoUpdate = current_timestamp();
-- DROP TRIGGER Tr_UltimoUpdateGaragem1;
CREATE TRIGGER Tr_UltimoUpdateGaragem2 BEFORE UPDATE ON GARAGEM
	FOR EACH ROW
		set new.UltimoUpdate = current_timestamp();
-- DROP TRIGGER Tr_UltimoUpdateGaragem2;

-- Registra data de atualização em LOCACAO
CREATE TRIGGER Tr_UltimoUpdateLocacao1 BEFORE INSERT ON LOCACAO
	FOR EACH ROW
		set new.UltimoUpdate = current_timestamp();
-- DROP TRIGGER Tr_UltimoUpdateLocacao1;
CREATE TRIGGER Tr_UltimoUpdateLocacao2 BEFORE UPDATE ON LOCACAO
	FOR EACH ROW
		set new.UltimoUpdate = current_timestamp();
-- DROP TRIGGER Tr_UltimoUpdateLocacao2;
SHOW Triggers;
--##### /GATILHOS/ #####--

--##### TESTES #####--
-----------
CALL CadastraCliente('Fernando Severino Aragão','755.244.601-37','46.731.548-6','06/01/1961','Masculino','fernandoseverinoaragao@gripoantonin.com','IIezCNXzt3','72594-001','Quadra QBR 7 Bloco A','Residencial Santos Dumont (Santa Maria)','Brasília','DF','(61) 99383-3185');
CALL CadastraCliente('Marcelo Pietro da Rocha','104.127.001-15','10.577.573-3','02/02/1978','Masculino','marcelopietrodarocha@sygma.com.br','yRGNSqybuM','70658-613','Quadra SHCES Quadra 1601 Bloco C','Cruzeiro Novo','Brasília','DF','(61) 99102-4511');
CALL CadastraCliente('Kaique Benedito Corte Real','310.678.151-39','13.997.823-9','01/03/2003','Masculino','kaiquebeneditocortereal@bluewash.com.br','oiIpoIeDPh','72579-370','Chácara Chácara 37','Condomínio Chácaras Ana Maria (Santa Maria)','Brasília','DF','(61) 99468-8152');
CALL CadastraCliente('Stella Francisca Luzia Aparício','085.242.381-00','45.375.454-5','10/01/1955','Feminino','stella-aparicio91@technicolor.com','s4qfwD8x5d','72311-407','Quadra QN 503 Conjunto 7','Samambaia Sul (Samambaia)','Brasília','DF','(61) 98187-9419');
CALL CadastraCliente('Joaquim Gustavo Pires','714.841.161-00','49.194.944-3','09/03/1958','Masculino','joaquim.gustavo.pires@zootecnista.com.br','xUrwR4rCBH','70730-714','Quadra SHCGN 703 Bloco N','Asa Norte','Brasília','DF','(61) 99658-1315');
CALL CadastraCliente('César Ian Jorge Silveira','229.020.111-13','31.918.078-5','10/03/1981','Masculino','cesar-silveira87@sebrace.com.br','CJKapFe8Sd','72231-222','Quadra QNP 12 Conjunto V','Ceilândia Sul (Ceilândia)','Brasília','DF','(61) 98650-1245');
CALL CadastraCliente('Ayla Sônia Gomes','516.001.511-67','12.142.303-7','04/03/2003','Feminino','ayla_sonia_gomes@semco.com.br','cN1oRA70Gj','72500-420','Quadra QR 100 Conjunto N','Santa Maria','Brasília','DF','(61) 99299-0453');
CALL CadastraCliente('Agatha Beatriz Isabelly da Rosa','226.484.561-98','21.322.769-1','11/03/1988','Feminino','agatha_beatriz_darosa@greenschool.com.br','ruLLDg7Uyi','71593-637','Quadra 378 Conjunto R','Del Lago II (Itapoã)','Brasília','DF','(61) 98573-3435');
CALL CadastraCliente('Simone Carla Daniela Barbosa','523.100.131-70','35.955.552-4','18/02/1952','Feminino','simone_barbosa@coreval.com.br','OEWQqTzPlK','71691-075','Quadra CMA 04','Centro (São Sebastião)','Brasília','DF','(61) 99509-3364');
CALL CadastraCliente('José Rodrigo Araújo','948.321.941-86','35.204.143-2','01/03/2000','Masculino','joserodrigoaraujo@aspxsistemas.com.br','H5FLhRTguK','71680-370','Condomínio Quintas do Sol','Setor Habitacional Jardim Botânico (Lago Sul)','Brasília','DF','(61) 99128-5771');
CALL CadastraCliente('Raquel Alessandra Luna Rodrigues','540.443.101-65','11.673.878-9','17/02/1982','Feminino','raquel_alessandra_rodrigues@flex-erp.com','0c9XfoPEGS','72410-202','Quadra Quadra 3 Conjunto B','Setor Sul (Gama)','Brasília','DF','(61) 99223-3496');
CALL CadastraCliente('Diogo Benedito Santos','239.540.891-30','46.879.236-3','06/01/1989','Masculino','diogo.benedito.santos@negleribeiro.com','BTeQNXffuZ','71300-000','Vila Estrutural','Vila Estrutural','Brasília','DF','(61) 98606-6320');
CALL CadastraCliente('André Cauã Rodrigo Galvão','234.782.191-16','49.153.108-4','11/03/1966','Masculino','andrecauagalvao@zipmail.com','iuOKsYR7uu','71805-132','Quadra QN 1 Conjunto 32','Riacho Fundo I','Brasília','DF','(61) 99912-8084');
CALL CadastraCliente('Maitê Stella Oliveira','398.075.771-44','47.658.885-6','05/02/1979','Feminino','maitestellaoliveira@br.atlascopco.com','iH0rCekWbb','72310-214','Conjunto SMSE Conjunto 14','Samambaia Sul (Samambaia)','Brasília','DF','(61) 99551-4143');
CALL CadastraCliente('Marcos Vinicius Murilo Iago da Paz','276.811.351-46','33.716.198-7','21/01/1982','Masculino','marcos.vinicius.dapaz@platinium.com.br','ffI2E1EUmu','72308-203','Quadra QN 314 Conjunto 3','Samambaia Sul (Samambaia)','Brasília','DF','(61) 98496-4545');
CALL CadastraCliente('Rodrigo Marcelo Isaac Rezende','942.845.421-41','44.537.170-5','06/03/1962','Masculino','rodrigo_rezende@parkhotel.com.br','oR4TIceH1s','70374-050','Quadra SQS 111 Bloco E','Asa Sul','Brasília','DF','(61) 99891-3408');
CALL CadastraCliente('Sebastiana Isabelly Antônia Silva','222.740.441-80','46.157.762-8','06/02/1951','Feminino','sebastianaisabelly@soulcomunic.com.br','mqSdkcOzub','70299-130','Quadra SQS 416 Bloco M','Asa Sul','Brasília','DF','(61) 99816-6644');
CALL CadastraCliente('Priscila Elisa Fernanda Moura','400.255.401-57','10.843.242-7','14/01/1964','Feminino','priscila-moura81@agaxtur.com.br','xXCaX3p08s','71660-260','Quadra SHIS QI 25 Conjunto 6','Setor de Habitações Individuais Sul','Brasília','DF','(61) 99834-9866');
CALL CadastraCliente('Antônia Gabriela das Neves','913.693.301-54','31.778.507-2','24/02/1976','Feminino','antonia-dasneves82@gmail.com.br','TS8wztRx3q','73041-710','Quadra 13 AR 04','Sobradinho','Brasília','DF','(61) 98566-8555');
CALL CadastraCliente('Camila Renata Lavínia Jesus','287.926.001-90','50.027.861-1','14/03/1995','Feminino','camilarenatajesus@lnaa.com.br','AjtHiw80kt','72317-522','Quadra QN 523 Conjunto B','Samambaia Sul (Samambaia)','Brasília','DF','(61) 98424-6835');
CALL CadastraCliente('Kauê Noah Márcio Teixeira','887.644.421-10','22.049.749-7','02/03/1965','Masculino','kaue-teixeira79@recnev.com.br','2Hxfa0PQo9','72725-403','Quadra Quadra 4 Conjunto C','Veredas (Brazlândia)','Brasília','DF','(61) 98640-7244');
CALL CadastraCliente('Elias Manuel Severino Barros','799.612.211-33','50.415.522-2','06/03/1980','Masculino','elias.manuel.barros@inforgel.com','zazNZOtLKq','72265-730','Quadra SMC Quadra 7','Setor de Materiais de Construção (Ceilândia)','Brasília','DF','(61) 98281-0892');
CALL CadastraCliente('Renato Joaquim Nogueira','017.739.411-00','42.741.549-4','04/03/1959','Masculino','renato_joaquim_nogueira@jeffersonbarroso.com.br','SR6CEpkF0X','71570-813','Quadra Quadra 8 Conjunto M','Paranoá','Brasília','DF','(61) 99141-2836');
CALL CadastraCliente('Fernando Pedro Henrique Viana','010.628.011-21','11.109.333-8','12/03/1980','Masculino','fernando-viana94@gruporeis.net','NEImFP6Jb7','72579-110','Chácara Chácara 11','Condomínio Chácaras Ana Maria (Santa Maria)','Brasília','DF','(61) 98595-8433');
CALL CadastraCliente('Daniela Evelyn Antonella Brito','953.977.851-48','23.462.085-7','18/02/1945','Feminino','daniela_evelyn_brito@gmail.com.br','kN4giXlf56','70684-030','Quadra SQNW 304 Bloco E','Setor Noroeste','Brasília','DF','(61) 99914-4915');
CALL CadastraCliente('Thales Cauê Renan Fernandes','514.164.011-64','50.625.120-2','23/02/1991','Masculino','thales.caue.fernandes@cancaonova.com','t9U697EfIi','72542-223','Quadra CL 212 Bloco C','Santa Maria','Brasília','DF','(61) 99881-6059');
CALL CadastraCliente('Antonio Osvaldo Nascimento','786.943.731-06','43.770.143-8','08/01/1994','Masculino','antonio_nascimento@madhause.com.br','2oPBdBKP2z','71736-300','Quadra Quadra 3','Setor de Indústrias Bernardo Sayão (Núcleo Bandeirante)','Brasília','DF','(61) 99316-3714');
CALL CadastraCliente('Aline Cristiane Moreira','101.362.131-03','12.068.457-3','25/01/2003','Feminino','aline.cristiane.moreira@freitasprior.com.br','akKloOD0OK','70790-147','Quadra SGAN 914 Módulo G','Asa Norte','Brasília','DF','(61) 98582-6132');
CALL CadastraCliente('Diogo Thales Caldeira','631.849.151-15','30.733.453-3','22/02/1950','Masculino','diogo_thales_caldeira@gruposimoes.com.br','ycTp6DHlZN','73340-511','Quadra Quadra 5 Conjunto 5K','Jardim Roriz (Planaltina)','Brasília','DF','(61) 99406-8220');
CALL CadastraCliente('Lavínia Lúcia Farias','639.630.271-34','18.994.247-2','04/03/1977','Feminino','lavinialuciafarias@igui.com.br','Nbhpog5T1z','71665-055','Quadra SHIS QL 24 Conjunto 5','Setor de Habitações Individuais Sul','Brasília','DF','(61) 98701-3045');
-----------
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('755.244.601-37', 1, '2022-03-15', '2022-03-20');
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('104.127.001-15', 2, '2022-03-24', '2022-04-02');
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('310.678.151-39', 3, '2022-04-01', '2022-04-10');
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('085.242.381-00', 4, '2022-03-16', '2022-05-14');
INSERT INTO LOCACAO(ClienteId, GaragemId, DataLocacao, DataRetorno) VALUES('639.630.271-34', 1, '2022-04-16', '2022-04-22');
--##### /TESTES/ #####--
