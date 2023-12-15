--TRABALHANDO COM DDL – DATA DEFINITION LANGUAGE

--Criação da Database
	CREATE DATABASE "empresa_XYZ"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

--Criação da Schema

CREATE SCHEMA LC;

--Criando as Tabelas Cliente


CREATE TABLE LC.Cliente 
    (id serial NOT NULL PRIMARY KEY, 
	 nome VARCHAR (50) NOT NULL,
     tipo CHAR NOT NULL);

COMMENT ON COLUMN LC.Cliente.tipo IS 'F - Física / J - Jurídica';

ALTER TABLE LC.Cliente add column celular VARCHAR(20);

--Criando Tabela Veículo

CREATE TABLE LC.Veiculo 
   (id serial NOT NULL, 
	nome VARCHAR (50) NOT NULL, 
	placa VARCHAR (12) NOT NULL, 
	km integer NOT NULL, 
	cor VARCHAR (20) NOT NULL, 
	ativo CHAR (1),
    PRIMARY KEY (id));
	
--Criando Tabela Consultor

CREATE TABLE LC.Consultor 
         (id bigserial NOT NULL PRIMARY KEY, 
         nome VARCHAR (50) NOT NULL, 
         id_veic integer NOT NULL, 
         id_cli integer NOT NULL, 
         qtd_visita integer NOT NULL, 
         vlr_visita money NOT NULL, 
        FOREIGN KEY (id_veic) REFERENCES LC.Veiculo (id),
        FOREIGN KEY (id_cli) REFERENCES LC.Cliente (id));
		
--Criando a Tabela Visita

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

--Alterando o Tipo de dado da coluna data_visita da Tabela LC.Visita
ALTER TABLE LC.Visita ALTER COLUMN data_visita TYPE TIMESTAMP;