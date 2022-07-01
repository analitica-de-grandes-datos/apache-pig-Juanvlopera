/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
info = LOAD 'data.tsv' USING PigStorage('\t') AS (Mayus:chararray,lower:chararray,lowers:map[]);
letras = FOREACH info GENERATE FLATTEN (lowers) as letra;
grouped = GROUP letras BY letra;
letracount = FOREACH grouped GENERATE group,COUNT(letras);
STORE letracount INTO 'output' USING PigStorage(',');
