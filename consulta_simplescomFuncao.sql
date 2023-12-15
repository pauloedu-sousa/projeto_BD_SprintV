--■ Realizando Consulta simples da tabela Consultor executando a Função tipoVisita e função multiplica
SELECT
   LC.Consultor.id AS "ID",
   LC.Consultor.nome AS "AGENTE",
   LC.Consultor.qtd_visita AS "QTD VISITA",
   tipoVisita(vlr_visita),
   multiplica(qtd_visita, vlr_visita) AS "Valor Total"
   
   FROM LC.Consultor;
