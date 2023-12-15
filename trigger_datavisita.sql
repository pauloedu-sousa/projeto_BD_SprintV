■ Criando TRIGGER before insert com função na coluna data_visita na tabela LC.Visita para inserir data e hora caso consultor não insira
CREATE FUNCTION data_visita()
RETURNS TRIGGER AS $$
BEGIN
  NEW.data_visita = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER datas_visitas
  BEFORE INSERT
  ON LC.Visita
  FOR EACH ROW
  EXECUTE PROCEDURE data_visita();
  
--Inserindo dados de visita sem informar data de visita executando Procedure
INSERT INTO LC.Visita (tipo_visita, id_veiculo, nome, placa,
km_saida, km_retorno, id_cliente, id_consultor)
VALUES ('A', '1', 'GOL 1000', 'RTY-2344', '300', '500', '2', '1');

INSERT INTO LC.Visita (tipo_visita, id_veiculo, nome, placa,
km_saida, km_retorno, id_cliente, id_consultor)
VALUES ('A', '1', 'GOL 1000', 'RTY-2344', '500', '700', '6', '1');

SELECT * FROM LC.Visita;
