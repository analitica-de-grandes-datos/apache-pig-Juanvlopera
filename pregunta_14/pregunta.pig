/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
info = LOAD 'data.csv' USING PigStorage(',') AS (numero:int,nombre:chararray,apellido:chararray,fecha:chararray,color:chararray,numero2:int);
filtrado = FILTER info BY NOT (STARTSWITH(color,'b'));
info2 = FOREACH filtrado GENERATE color;
STORE info2 INTO 'output' USING PigStorage(',');

