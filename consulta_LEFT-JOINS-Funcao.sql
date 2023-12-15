--■ REALIZANDO CONSULTAS UTILIZANDO INNER LEFT JOIN UNINDO 
--AS TABELAS COM OS DADOS DA ESQUERDA E EXECUTANDO AS FUNÇÕES tipoVisita e multiplica

SELECT LC.Cliente.ID AS "Código",
       LC.Cliente.nome AS "Nome",
	   LC.Cliente.celular AS "Fone",
	   LC.Visita.data_visita AS "Data",
	   LC.Consultor.id AS "CONSULTOR",
	   LC.Visita.id AS "VISITA",
	   tipoVisita(vlr_visita) as "TIPO",
	   LC.Veiculo.nome AS "Carro",
	   multiplica(qtd_visita, vlr_visita) AS "Valor Total"
	   
FROM LC.Cliente
   LEFT JOIN LC.Consultor ON (LC.Consultor.id_cli = LC.Cliente.id)
   LEFT JOIN LC.Visita  ON (LC.Visita.id_cliente = LC.Cliente.id)
   LEFT JOIN LC.Veiculo ON (LC.Veiculo.id = LC.Visita.id_veiculo)
