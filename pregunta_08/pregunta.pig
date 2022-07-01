/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
info = LOAD 'data.tsv' USING PigStorage('\t') AS (Mayus:chararray,lower:bag{A:tuple(B:chararray)},lowers:map[]);
info2 = FOREACH info GENERATE FLATTEN (lower) as letra, FLATTEN (lowers) as letras;
grouped = GROUP info2 BY (letra,letras);
letracount = FOREACH grouped GENERATE group,COUNT(info2);
STORE letracount INTO 'output' USING PigStorage(',');
