--■ REALIZANDO CONSULTAS UTILIZANDO RIGHT JOIN UNINDO  
--AS TABELAS COM OS DADOS DA DIREITA E EXECUTANDO AS FUNÇÕES tipoVisita e multiplica
   
SELECT LC.Cliente.ID AS "Código",
       LC.Cliente.nome AS "Nome",
	   LC.Cliente.celular AS "Fone",
	   LC.Consultor.id AS "Consultor",
	   LC.Veiculo.nome AS "Carro",
	   LC.Visita.data_visita AS "Data",
	   LC.Visita.id AS "VISITA",
	   tipoVisita(vlr_visita) as "TIPO",
	   multiplica(qtd_visita, vlr_visita) AS "Valor Total"
	   
FROM LC.Cliente
   RIGHT JOIN LC.Visita  ON (LC.Visita.id_cliente = LC.Cliente.id)
   RIGHT JOIN LC.Veiculo ON (LC.Veiculo.id = LC.Visita.id_veiculo)
   RIGHT JOIN LC.Consultor ON (LC.Consultor.id = LC.Visita.id_consultor)



