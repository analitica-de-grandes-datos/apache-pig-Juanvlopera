/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
info = LOAD 'data.tsv' USING PigStorage('\t') AS (Mayus:chararray,lower:bag{A:tuple(B:chararray)},lowers:map[]);
letras = FOREACH info GENERATE Mayus, SIZE(lower) AS nlower, SIZE(lowers) AS nlowers;
ordered = ORDER letras BY Mayus,nlower,nlowers;
STORE ordered INTO 'output' USING PigStorage(',');