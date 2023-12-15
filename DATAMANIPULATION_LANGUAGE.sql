--TRABALHANDO COM DML – DATA MANIPULATION LANGUAGE

--POPULANDO DADOS NAS TABELAS – INSERT

INSERT INTO LC.Cliente (nome, tipo, celular)
VALUES ('Gustavo', 'F', '(93)91445589'),
	   ('OTAVIO MESQUITA', 'J', '(99)93355589'),
       ('PEDRO OURES', 'J', '(92)93445589'),
	   ('EFRAIN AGUIAR', 'F', '(93)91538504'),
	   ('CLEUDIMAR MORAES', 'J', ''),
	   ('Manassés Moraes', 'J', '(94)935561206'),
	   ('Ketllen Rebeca', 'J', '(91)998149022');
SELECT * FROM LC.Cliente;

INSERT INTO LC.Veiculo (nome, placa, km, cor, ativo) 
VALUES ('GOL 1000', 'RTY-2344', '0', 'AZUL', 'S'),										  
       ('SAVEIRO CROSS', 'ATR-3234', '0', 'AZUL', 'S'), 
       ('FIAT SIENA', 'XXI-5994', '0', 'AZUL', 'S'),
	   ('FIAT PALIO', 'ABC-1234', '0', 'AZUL', 'S'), 
       ('FIAT PALIO', 'ABX-3356', '0', 'AZUL', 'S');
	   
INSERT INTO LC.Veiculo (nome, placa, km, cor, ativo)
VALUES ('ONIX 1.6', 'JDE-7777', '0', 'BRANCO', 'S');

SELECT * FROM LC.Veiculo;

INSERT INTO LC.Consultor (nome, id_veic, id_cli, qtd_visita, vlr_visita)
VALUES ('GUSTAVO BIAL', '1', '1', '1', '1200'),
       ('ROMARIO ABREU', '2', '2', '1', '2000'),
	   ('ROGERIO ALVES', '3', '3', '1', '1500'),
	   ('GUSTAVO BRETA', '4', '4', '1', '1890'),
	   ('FELIPE SIQUEIRA', '5', '5', '1', '2100');

INSERT INTO LC.Consultor (nome, id_veic, id_cli, qtd_visita, vlr_visita)
VALUES('PAULO SOUSA', '6', '6', '4', '1800.00');

SELECT * FROM LC.Consultor;

INSERT INTO LC.Visita (data_visita, tipo_visita, id_veiculo, nome, placa,
km_saida, km_retorno, id_cliente, id_consultor)
VALUES ('01/10/2018', 'C', '1', 'GOL 1000', 'RTY-2344', 
'0', '300', '1', '1'),
       ('05/10/2018', 'C', '2', 'SAVEIRO CROSS', 'ATR-3234', 
'0', '250', '2', '2'),
       ('20/10/2018', 'C', '3', 'FIAT SIENA', 'XXI-5994', 
'0', '350', '3', '3'),
       ('25/10/2018', 'C', '4', 'FIAT PALIO', 'ABC-1234', 
'0', '120', '4', '4'),
       ('29/10/2018', 'C', '5', 'FIAT PALIO', 'ABX-3356', 
'0', '170', '5', '5');

-- CONSULTA BÁSICA - SELECT
SELECT * FROM LC.Visita;
SELECT * FROM LC.Consultor;
SELECT * FROM LC.Veiculo;

--Inserindo dados de visita sem informar data de visita executando Procedure
INSERT INTO LC.Visita (tipo_visita, id_veiculo, nome, placa,
km_saida, km_retorno, id_cliente, id_consultor)
VALUES ('A', '1', 'GOL 1000', 'RTY-2344', '300', '500', '2', '1');

INSERT INTO LC.Visita (tipo_visita, id_veiculo, nome, placa,
km_saida, km_retorno, id_cliente, id_consultor)
VALUES ('A', '1', 'GOL 1000', 'RTY-2344', '500', '700', '6', '1');

INSERT INTO LC.Visita (tipo_visita, id_veiculo, nome, placa,
km_saida, km_retorno, id_cliente, id_consultor)
VALUES ('C', '1', 'GOL 1000', 'RTY-2344', '700', '800', '5', '1');

SELECT * FROM LC.Visita;
alter table LC.Consultor alter column vlr_visita type float;

