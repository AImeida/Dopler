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

-- Dados do cliente
select ClienteId, Nome, ceil(datediff(current_date, DataNasc)/365) as 'Idade', Telefone, Uf, Cidade, Bairro, DataCadastro, Ativo 
from cliente
inner join endereco using (EnderecoId);

-- Categoria dos modelos
select CategoriaId, Categoria, Fabricante, Modelo, Lugares, Direcao, Cambio, Ano, concat('R$', round(PrecoAluguel)) 'Diária'
from modelo
inner join categoria using (CategoriaId)
order by CategoriaId;

-- quais modelos em que locadoras
select Locadora, Modelo
from garagem
inner join locadora using (LocadoraId)
inner join modelo using (ModeloId)
order by Modelo;

-- Média dos preços por categoria
select CategoriaId, Categoria, concat('R$', format(sum(PrecoAluguel)/count(*), 0)) 'Diária Média' from modelo
inner join categoria using (CategoriaId)
group by CategoriaId
order by CategoriaId;

-- Status do veículo em cada locadora
select Locadora, Modelo, Status
from garagem
inner join modelo using (ModeloId)
inner join locadora using (LocadoraId)
inner join status using (StatusId)
order by locadora;

-- Quem alugou o quê
create view vw_AluguelCliente as
select ClienteId, Nome, Modelo, Fabricante, concat('R$', round(PrecoAluguel)) 'Diaria', Locadora, date_format(DataLocacao, '%d/%m/%Y') 'DataLocacao', date_format(DataRetorno, '%d/%m/%Y') 'DataRetorno', datediff(DataRetorno, DataLocacao) 'Dias'
from locacao
inner join cliente using (ClienteId)
inner join garagem using (GaragemId)
inner join locadora using (LocadoraId)
inner join modelo using (ModeloId);
-- drop view vw_aluguelcliente;
select * from vw_AluguelCliente;

-- Valor pago
select Nome 'Cliente', ClienteId 'CPF', concat(Fabricante, ' ', Modelo) 'Modelo', concat(DataLocacao, ' - ', DataRetorno) 'Periodo', Diaria, Dias, concat('R$', round(Valor)) 'Total'
from pagamento
inner join vw_aluguelcliente using (ClienteId);

--##### /TESTES/ #####--