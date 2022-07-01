/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
info = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray,fecha:chararray,numero:int);
specific_columns = FOREACH info GENERATE numero;
ordered_data = ORDER specific_columns BY numero;
limit_data = LIMIT ordered_data 5;  

STORE limit_data INTO 'output' USING PigStorage(',');
