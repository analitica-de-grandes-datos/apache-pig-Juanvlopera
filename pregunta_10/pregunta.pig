/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
info = LOAD 'data.csv' USING PigStorage(',') AS (numero:int,nombre:chararray,apellido:chararray,fecha:chararray,color:chararray,numero2:int);
info2 = FOREACH info GENERATE apellido, SIZE(apellido) AS longitud;
ordered = ORDER info2 BY longitud DESC, apellido ASC;
limited = LIMIT ordered 5;
STORE limited INTO 'output' USING PigStorage(',');
