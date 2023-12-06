CREATE TABLE LC.Cliente (id serial NOT NULL PRIMARY KEY, nome VARCHAR (50) NOT NULL,
tipo CHAR NOT NULL);

COMMENT ON COLUMN LC.Cliente.tipo IS 'F - Física / J - Jurídica';

ALTER TABLE LC.Cliente add column celular VARCHAR(20);

CREATE TABLE LC.Veiculo (id serial NOT NULL, nome VARCHAR (50) NOT NULL, placa VARCHAR (12) NOT NULL, km integer NOT NULL, cor VARCHAR (20) NOT NULL, ativo CHAR (1),
PRIMARY KEY (id));

CREATE TABLE LC.Consultor 
         (id bigserial NOT NULL PRIMARY KEY, 
         nome VARCHAR (50) NOT NULL, 
         id_veic integer NOT NULL, 
         id_cli integer NOT NULL, 
         qtd_visita integer NOT NULL, 
         vlr_visita money NOT NULL, 
        FOREIGN KEY (id_veic) REFERENCES LC.Veiculo (id),
        FOREIGN KEY (id_cli) REFERENCES LC.Cliente (id));

CREATE TABLE LC.Visita (
	id bigserial NOT NULL PRIMARY KEY,
	data_visita DATE NOT NULL DEFAULT now(),
	tipo_visita CHAR NOT NULL,
	id_veiculo serial NOT NULL,
	nome VARCHAR (50) NULL,
	placa VARCHAR (12) NULL,
	km_saida integer NOT NULL,
	km_retorno integer NOT NULL,
	id_cliente integer NOT NULL,
	id_consultor integer NOT NULL,
	FOREIGN KEY (id_veiculo) REFERENCES LC.Veiculo (id),
	FOREIGN KEY (id_cliente) REFERENCES LC.Cliente (id),
	FOREIGN KEY (id_consultor) REFERENCES LC.Consultor (id)
);

COMMENT ON COLUMN LC.Visita.tipo_visita IS 'C - CONSULTORIA / A - ACESSORIA';

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

SELECT * FROM LC.Veiculo;

INSERT INTO LC.Consultor (nome, id_veic, id_cli, qtd_visita, vlr_visita)
VALUES ('GUSTAVO BIAL', '1', '1', '1', '1200'),
       ('ROMARIO ABREU', '2', '2', '1', '2000'),
	   ('ROGERIO ALVES', '3', '3', '1', '1500'),
	   ('GUSTAVO BRETA', '4', '4', '1', '1890'),
	   ('FELIPE SIQUEIRA', '5', '5', '1', '2100');

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

-- CONSULTA BÁSICA -  UTILIZANDO WHERE - SELECT
SELECT * FROM LC.Cliente
WHERE  id = 5;


--■ REALIZANDO CONSULTAS UTILIZANDO JOINs UNINDO AS TABELAS
SELECT LC.Consultor.nome as "CONSULTOR",
	   LC.Visita.data_visita  as "DATA VISITA",
	   LC.Cliente.nome  as "CLIENTE",
	   LC.Veiculo.placa  as "VEÍCULO",
	   LC.Visita.km_saida  as "KM SAÍDA",
	   LC.Visita.km_retorno  as "KM RETORNO",
	   LC.Consultor.qtd_visita as "QTD",
	   LC.Consultor.vlr_visita as "Comissão"
FROM LC.Visita
	INNER JOIN LC.Consultor  ON (LC.Consultor.id = LC.Visita.id_consultor)
	INNER JOIN LC.Cliente  ON (LC.Cliente.id = LC.Visita.id_cliente)
	INNER JOIN LC.Veiculo  ON (LC.Veiculo.id = LC.Visita.id_veiculo);
	
--Criando TRIGGER NAS TABELAS

DELIMITER $$
CREATE TRIGGER inserir_dados
AFTER INSERT
ON LC.Cliente FOR EACH ROW
BEGIN
 IF NEW.celular IS NULL THEN
    INSERT INTO lembrete(id, mensagem)
	VALUES(new.id,CONCAT(Oi', NEW.nome,', atualize seu celular.'));
 END IF;
END$$

	
--Criando um PROCEDURE (Procedimento) PARA RESGATAR DADOS DE UMA TABELA
DELIMITER//
 CREATE PROCEDURE verVisitas()					 
 BENGIN
  SELECT * FROM LC.Visita;
 END//
 DELIMITER;
						 
DELIMITER$$
 CREATE PROCEDURE saberValor (visita smallint)
 select CONCAT('O Valor é', vlr_visita) AS Total
 BENGIN
  SELECT * FROM LC.Visita;
  WHERE id = visita;
 END//
 DELIMITER;







