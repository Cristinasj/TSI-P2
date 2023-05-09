% PROBLEMA DE LOS HORARIOS 
% Cristina Sánchez Justicia
include "globals.mzn"; 
set of int: HORAS = 8..13;
% Hora a la que se imparten las tutorias
int: tutorias = 11; 
set of int: DIAS = 1..5; 
% La asignatura 10 es de tutorías
% Las asignaturas de 11 a 15 son la segunda parte de las asignaturas 1, 3, 4, 5, y 8 respectivamente 
set of int: ASIGNATURAS = 1..15;   

% Cantidad de horas que se deben impartir de cada asingatura 
array [ASIGNATURAS] of 1..5: horasTotales = [2, 2, 2, 2, 2, 2, 2, 1, 1, 5, 2, 2, 2, 2, 1];

% La solución se va a representar como una matriz con el horario
array[DIAS,HORAS] of var ASIGNATURAS: horario;

% En cada día de la semana solo se puede impartir, como máximo, un bloque de cada asignatura 
constraint all_different([ horario[1,i] | i in HORAS]); % Lunes 
constraint all_different([ horario[2,i] | i in HORAS]); % Martes
constraint all_different([ horario[3,i] | i in HORAS]); % Miércoles 
constraint all_different([ horario[4,i] | i in HORAS]); % Jueves 
constraint all_different([ horario[5,i] | i in HORAS]); % Viernes 

% De cada asignatura se tienen que impartir las horas establecidas
constraint count(horario, 1) == horasTotales[1]; 
constraint count(horario, 2) == horasTotales[2];
constraint count(horario, 3) == horasTotales[3];
constraint count(horario, 4) == horasTotales[4];
constraint count(horario, 5) == horasTotales[5];
constraint count(horario, 6) == horasTotales[6];
constraint count(horario, 7) == horasTotales[7];
constraint count(horario, 8) == horasTotales[8];
constraint count(horario, 9) == horasTotales[9];
constraint count(horario, 10) == horasTotales[10];
constraint count(horario, 11) == horasTotales[11];
constraint count(horario, 12) == horasTotales[12];
constraint count(horario, 13) == horasTotales[13];
constraint count(horario, 14) == horasTotales[14];
constraint count(horario, 15) == horasTotales[15];

% Hay asignaturas que tienen que impartirse en bloques consecutivos 
% La primera hora de las asignaturas dobles no pueden impartirse a ultima hora 
constraint forall(i in DIAS)(horario[i,13] != 1 /\ horario[i,13] != 3/\ horario[i,13] != 4/\ horario[i,13] != 5/\ horario[i,13] != 5); 

% La segunda hora de las asingaturas dobles no pueden impartirse a primera hora 
constraint forall(i in DIAS)(horario[i,8] != 11 /\ horario[i,8] != 12/\ horario[i,8] != 13/\ horario[i,8] != 14/\ horario[i,8] != 15);

% Después de las asingaturas 1, 3, 4, 5 y 8 vienen las 11,12,13,14 y 15 respectivamente
constraint forall(i,j in 1..5)(horario[i,j+7] == 1 <-> horario[i,j+8] == 11); 
constraint forall(i,j in 1..5)(horario[i,j+7] == 3 <-> horario[i,j+8] == 12); 
constraint forall(i,j in 1..5)(horario[i,j+7] == 4 <-> horario[i,j+8] == 13); 
constraint forall(i,j in 1..5)(horario[i,j+7] == 5 <-> horario[i,j+8] == 14); 
constraint forall(i,j in 1..5)(horario[i,j+7] == 8 <-> horario[i,j+8] == 15); 

% A1 no puede impartirse el mismo día que A3 
constraint forall(i,j in HORAS)(horario[1,i] == 1 -> horario[1,j] != 3);  
constraint forall(i,j in HORAS)(horario[1,i] == 3 -> horario[1,j] != 1);
constraint forall(i,j in HORAS)(horario[2,i] == 1 -> horario[2,j] != 3);  
constraint forall(i,j in HORAS)(horario[2,i] == 3 -> horario[2,j] != 1);
constraint forall(i,j in HORAS)(horario[3,i] == 1 -> horario[3,j] != 3);  
constraint forall(i,j in HORAS)(horario[3,i] == 3 -> horario[3,j] != 1);
constraint forall(i,j in HORAS)(horario[4,i] == 1 -> horario[4,j] != 3);  
constraint forall(i,j in HORAS)(horario[4,i] == 3 -> horario[4,j] != 1);
constraint forall(i,j in HORAS)(horario[5,i] == 1 -> horario[5,j] != 3);  
constraint forall(i,j in HORAS)(horario[5,i] == 3 -> horario[5,j] != 1);

% A4 no puede impartirse el mismo día que A5 
constraint forall(i,j in HORAS)(horario[1,i] == 4 -> horario[1,j] != 5);  
constraint forall(i,j in HORAS)(horario[1,i] == 5 -> horario[1,j] != 4);
constraint forall(i,j in HORAS)(horario[2,i] == 4 -> horario[2,j] != 5);  
constraint forall(i,j in HORAS)(horario[2,i] == 5 -> horario[2,j] != 4);
constraint forall(i,j in HORAS)(horario[3,i] == 4 -> horario[3,j] != 5);  
constraint forall(i,j in HORAS)(horario[3,i] == 5 -> horario[3,j] != 4);
constraint forall(i,j in HORAS)(horario[4,i] == 4 -> horario[4,j] != 5);  
constraint forall(i,j in HORAS)(horario[4,i] == 5 -> horario[4,j] != 4);
constraint forall(i,j in HORAS)(horario[5,i] == 4 -> horario[5,j] != 5);  
constraint forall(i,j in HORAS)(horario[5,i] == 5 -> horario[5,j] != 4);

% A6 no puede impartirse el mismo día que A9  
constraint forall(i,j in HORAS)(horario[1,i] == 6 -> horario[1,j] != 9);  
constraint forall(i,j in HORAS)(horario[1,i] == 9 -> horario[1,j] != 6);
constraint forall(i,j in HORAS)(horario[2,i] == 6 -> horario[2,j] != 9);  
constraint forall(i,j in HORAS)(horario[2,i] == 9 -> horario[2,j] != 6);
constraint forall(i,j in HORAS)(horario[3,i] == 6 -> horario[3,j] != 9);  
constraint forall(i,j in HORAS)(horario[3,i] == 9 -> horario[3,j] != 6);
constraint forall(i,j in HORAS)(horario[4,i] == 6 -> horario[4,j] != 9);  
constraint forall(i,j in HORAS)(horario[4,i] == 9 -> horario[4,j] != 6);
constraint forall(i,j in HORAS)(horario[5,i] == 6 -> horario[5,j] != 9);  
constraint forall(i,j in HORAS)(horario[5,i] == 9 -> horario[5,j] != 5);

% La cuarta franja horaria debe reservarse para las tutorias, es decir, no asignar ninguna asignatura
constraint horario[1,tutorias] == 10;  
constraint horario[2,tutorias] == 10;
constraint horario[3,tutorias] == 10;
constraint horario[4,tutorias] == 10;
constraint horario[5,tutorias] == 10;

% Restricciones horarias de los profesores 
% Las asignaturas A1 y A3 tienen que empezar a darse a las 12 
constraint horario[1,12] == 1 \/ horario[2,12] == 1\/ horario[3,12] == 1\/ horario[4,12] == 1\/ horario[5,12] == 1; 
constraint horario[1,12] == 3 \/ horario[2,12] == 3 \/ horario[3,12] == 3 \/ horario[4,12] == 3 \/ horario[5,12] == 3;
  
% Las asignaturas A4 y A5 tienen que darse en las tres primeras horas de la mañana 
constraint horario[1,8] == 4 \/ horario[2,8] == 4 \/ horario[3,8] == 4 \/ horario[4,8] == 4 \/ horario[5,8] == 4; 
constraint horario[1,8] == 5 \/ horario[2,8] == 5 \/ horario[3,8] == 5 \/ horario[4,8] == 5 \/ horario[5,8] == 5;
constraint horario[1,9] == 4 \/ horario[2,9] == 4 \/ horario[3,9] == 4 \/ horario[4,9] == 4 \/ horario[5,9] == 4;
constraint horario[1,9] == 5 \/ horario[2,9] == 5 \/ horario[3,9] == 5 \/ horario[4,9] == 5 \/ horario[5,9] == 5;
constraint horario[1,10] == 4 \/ horario[2,10] == 4 \/ horario[3,10] == 4 \/ horario[4,10] == 4 \/ horario[5,10] == 4;
constraint horario[1,10] == 5 \/ horario[2,10] == 5 \/ horario[3,10] == 5 \/ horario[4,10] == 5 \/ horario[5,10] == 5;

% Las asignaturas A6 y A9 tienen que darse antes de las tutorias
constraint horario[1,tutorias-1] == 6 \/ horario[2,tutorias-1] == 6 \/ horario[3,tutorias-1] == 6 \/ horario[4,tutorias-1] == 6 \/ horario[5,tutorias-1] == 6; 
constraint horario[1,tutorias-1] == 9 \/ horario[2,tutorias-1] == 9 \/ horario[3,tutorias-1] == 9 \/ horario[4,tutorias-1] == 9 \/ horario[5,tutorias-1] == 9; 

% Restricciones de días de las asingaturas 
% Asignatura 1 no puede ser impartida el miercoles, jueves ni viernes
constraint forall(i in HORAS)(horario[3,i] != 1);
constraint forall(i in HORAS)(horario[4,i] != 1); 
constraint forall(i in HORAS)(horario[5,i] != 1);

% Asignatura 3 no puede ser impartida el lunes, martes o viernes 
constraint forall(i in HORAS)(horario[1,i] != 3);
constraint forall(i in HORAS)(horario[2,i] != 3); 
constraint forall(i in HORAS)(horario[5,i] != 3);

% Asignatura 4 no puede ser impartida el miércoles, jueves o viernes 
constraint forall(i in HORAS)(horario[3,i] != 4);
constraint forall(i in HORAS)(horario[4,i] != 4); 
constraint forall(i in HORAS)(horario[5,i] != 4);

% Asignatura 5 no puede ser impartida el lunes, martes o miércoles 
constraint forall(i in HORAS)(horario[1,i] != 5);
constraint forall(i in HORAS)(horario[2,i] != 5); 
constraint forall(i in HORAS)(horario[3,i] != 5);

% Asignatura 6 no puede ser impartida el lunes, martes o jueves 
constraint forall(i in HORAS)(horario[1,i] != 6);
constraint forall(i in HORAS)(horario[2,i] != 6); 
constraint forall(i in HORAS)(horario[4,i] != 6);

% Asignatura 7 no puede ser impartida el lunes, miércoles o jueves 
constraint forall(i in HORAS)(horario[1,i] != 7);
constraint forall(i in HORAS)(horario[3,i] != 7); 
constraint forall(i in HORAS)(horario[4,i] != 7);

% Asignatura 8 no puede ser impartida el lunes, martes, jueves o viernes 
constraint forall(i in HORAS)(horario[1,i] != 8);
constraint forall(i in HORAS)(horario[2,i] != 8); 
constraint forall(i in HORAS)(horario[4,i] != 8);
constraint forall(i in HORAS)(horario[5,i] != 8);

% Asignatura 9 no puede ser impartida el martes, miércoles, jueves o viernes 
constraint forall(i in HORAS)(horario[2,i] != 9);
constraint forall(i in HORAS)(horario[3,i] != 9); 
constraint forall(i in HORAS)(horario[4,i] != 9);
constraint forall(i in HORAS)(horario[5,i] != 9);

solve satisfy;

%output ["    L  M  X  J  V\n8h  \(horario[1,8])  \(horario[2,8])  \(horario[3,8])  \(horario[4,8])  \(horario[5,8])\n9h  \(horario[1,9])  \(horario[2,9])  \(horario[3,9])  \(horario[4,9])  \(horario[5,9])\n10h  \(horario[1,10])  \(horario[2,10])  \(horario[3,10])  \(horario[4,10])  \(horario[5,10])\n11h  \(horario[1,11])  \(horario[2,11])  \(horario[3,11])  \(horario[4,11])  \(horario[5,11])\n12h  \(horario[1,12])  \(horario[2,12])  \(horario[3,12])  \(horario[4,12])  \(horario[5,12])\n13h  \(horario[1,13])  \(horario[2,13])  \(horario[3,13])  \(horario[4,13])  \(horario[5,13])\n"];  

# Comprobar soluciones simétricas 
# Comprobar cantidad de soluciones que salen 