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

A = LOAD './data.tsv' AS (letter:chararray, date:chararray, amount:int);
B = GROUP A BY letter;
C = FOREACH B GENERATE group, COUNT(A);

STORE C INTO 'output/' using PigStorage(',');
