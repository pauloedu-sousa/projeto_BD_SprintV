--■ Criação da Função que retorna tipoVisita CONFORME VALOR DA VISITA

CREATE FUNCTION tipoVisita(vlr_visita MONEY)
RETURNS TEXT AS $$
BEGIN
    IF vlr_visita < 2000 THEN
	     RETURN 'Acessoria';
    ELSIF vlr_visita > 2000 THEN
	       RETURN 'Consultoria';
    ELSE 
	   RETURN 'Não parametizado';
    END IF;
END;
$$ language 'plpgsql';

--■ EXCLUINDO A FUNÇÃO tipoVisita com o DROP
DROP FUNCTION tipoVisita(MONEY);

--■ Recriando a função tipoVisita excluida
CREATE OR REPLACE FUNCTION tipoVisita(vlr_visita DOUBLE PRECISION)
RETURNS TEXT AS $$
BEGIN
    IF vlr_visita < 2000 THEN
	     RETURN 'Acessoria';
    ELSIF vlr_visita > 2000 THEN
	       RETURN 'Consultoria';
    ELSE 
	   RETURN 'Não parametizado';
    END IF;
END;
$$ language 'plpgsql';
