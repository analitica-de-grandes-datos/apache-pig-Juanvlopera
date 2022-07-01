/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
info = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray,fecha:chararray,numero:int);
grouped = GROUP info BY letra;
letracount = FOREACH grouped GENERATE group, COUNT(info);
STORE letracount INTO 'output' USING PigStorage(',');