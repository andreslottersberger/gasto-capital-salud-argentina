SELECT
  a.variable,
  a.valor AS valor_2019,
  b.valor AS valor_2021
FROM argentina a
JOIN argentina b
  ON a.variable = b.variable
WHERE a.anio = 2019
  AND b.anio = 2021
  AND a.variable = 'Capital health expenditure (% of GDP)';
