--■ REALIZANDO CONSULTAS UTILIZANDO INNER JOIN  UNINDO 
--AS TABELAS E EXECUTANDO AS FUNÇÕES tipoVisita e multiplica


SELECT LC.Consultor.nome as "CONSULTOR",
	   LC.Visita.data_visita  as "DATA VISITA",
	   LC.Cliente.id as "Código",
	   LC.Cliente.nome  as "CLIENTE",
	   LC.Cliente.celular as "Fone",
	   LC.Veiculo.placa  as "VEÍCULO",
	   LC.Visita.km_saida  as "KM SAÍDA",
	   LC.Visita.km_retorno  as "KM RETORNO",
	   tipoVisita(vlr_visita) as "TIPO",
	   LC.Consultor.qtd_visita as "QTD",
	   LC.Consultor.vlr_visita as "Comissão",
	   multiplica(qtd_visita, vlr_visita) AS "Valor Total"
FROM LC.Visita
	INNER JOIN LC.Consultor  ON (LC.Consultor.id = LC.Visita.id_consultor)
	INNER JOIN LC.Cliente  ON (LC.Cliente.id = LC.Visita.id_cliente)
	INNER JOIN LC.Veiculo  ON (LC.Veiculo.id = LC.Visita.id_veiculo)
