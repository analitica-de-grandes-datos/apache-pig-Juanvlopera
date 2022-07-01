/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u
   WHERE 
       color REGEXP '.n';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
info = LOAD 'data.csv' USING PigStorage(',') AS (numero:int,nombre:chararray,apellido:chararray,fecha:chararray,color:chararray,numero2:int);
filtrado = FILTER info BY (color MATCHES '.*n');
info2 = FOREACH filtrado GENERATE nombre, color;
STORE info2 INTO 'output' USING PigStorage(',');
