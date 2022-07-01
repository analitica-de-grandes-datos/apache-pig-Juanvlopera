/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
info = LOAD 'data.tsv' USING PigStorage('\t') AS (Mayus:chararray,lower:chararray,lowers:map[]);
letras = FOREACH info GENERATE FLATTEN(TOKENIZE(lower)) AS letra;
grouped = GROUP letras BY letra;
letracount = FOREACH grouped GENERATE group,COUNT(letras);
limit_data = LIMIT letracount 7;
STORE limit_data INTO 'output' USING PigStorage(',');