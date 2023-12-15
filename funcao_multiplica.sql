--■ Criando Funcções multiplica
CREATE FUNCTION multiplica(num1 INT, num2 FLOAT)
  RETURNS FLOAT AS $$
  BEGIN
   RETURN num1 * num2;
  END
$$ LANGUAGE 'plpgsql';
--■ Aplicando a função multiplica em uma Consulta simples
SELECT multiplica(3, 1500.00)
