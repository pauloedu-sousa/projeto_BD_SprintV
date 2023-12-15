--■ Criando Funcções aplicar_desconto
CREATE  FUNCTION aplicar_desconto(vlr_visita FLOAT, desconto FLOAT)
  RETURNS FLOAT AS $$
  BEGIN
   RETURN vlr_visita * (1 - desconto);
  END
$$ LANGUAGE 'plpgsql'

--■ Excluindo a função aplicar_desconto
DROP FUNCTION aplicar_desconto

--■ Recriando a Função aplicar_desconto
CREATE OR REPLACE FUNCTION aplicar_desconto(vlr_visita FLOAT, desconto FLOAT)
  RETURNS FLOAT AS $$
  BEGIN
   RETURN vlr_visita * (1 - desconto);
  END
$$ LANGUAGE 'plpgsql'

--■ Aplicando a função aplicar_desconto em uma Consult Joins
SELECT LC.Consultor.nome AS "Nome", aplicar_desconto(vlr_visita, 0.20)
	 FROM LC.Consultor
