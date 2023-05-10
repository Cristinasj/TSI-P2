set of int: tareas = 1..10; 
set of int: workers = 1..3; 
set of int: workers4 = 1..4; 
array[tareas, workers] of int: tiempos = [|
    5, 7, 10 | 
    3, 5, 7  | 
    3, 2, 4  |
    2, 5, 8  | 
    4, 3, 6  |
    3, 2, 1  |
    2, 2, 3  |
    1, 3, 5  |
    2, 3, 4  |
    3, 2, 1  |]; 
array[tareas] of var int: inicio; 
array[tareas] of var int: fin; 
array[workers, tareas] of var 0..1: asignacion; 
var int: duracion; 

% RESTRICCIONES
% Una tarea puede hacerse solo por un trabajador 
constraint forall(t in tareas)(
    sum(w in workers)(if asignacion[w,t] == 1 then 1 else 0 endif) == 0
); 

% Un trabajador puede hacer solo una tarea a la vez 
constraint forall(w4 in workers4, t1,t2 in tareas)(
  % Si el mismo trabajador realiza dos tareas distintas, entonces sus tiempos no pueden solaparse. En otras palabras, el tiempo de inicio de una tiene que ser mayor que el tiempo fin de la otra.
  if ( t1 !=t2 /\ asignacion[w4,t1] == 1 /\ asignacion[w4,t2] == 1) then
    fin[t1] < inicio[t2] \/ fin[t2] < inicio[t1]    
  endif
);

% 3ª Restricción: El tiempo de fin debe ser el tiempo de inicio de la tarea, más lo que tarde el trabajador j-ésimo en realizarla. Dividimos por casos, según la participación o no del 4º trabajador. 
constraint forall(i in tareas)(
  forall(j in workers)(
  % Si se le ha asignado la tarea i-ésima al trabajador j-ésimo, entonces cogemos el tiempo que tarda este para la tarea en cuestión. En este caso, no tenemos en cuenta la aportación del trabajador 4. 
  if ( asignacion[j,i] == 1 /\ ( ( asignacion[4,i] == 1 /\ tiempos[i,j] < 3 ) \/ asignacion[4,i] == 0) ) then
    fin[i] == inicio[i] + tiempos[i,j] - 1

  % En caso de que la duración sea mayor o igual que 3, y el 4ª trabajador pueda entrar en escena, se reduce la duración en 2 días.     
  else if ( asignacion[j,i] == 1 /\ asignacion[4,i] == 1 /\ tiempos[i,j] >= 3 ) then
    fin[i] == inicio[i] + tiempos[i,j] - 3
  else true endif  endif
  )  
);

% 4ª Restricción: Los tiempos deben ser mayores a 0
constraint forall(i in tareas)(inicio[i] > 0 /\ fin[i] > 0);

% 5ª Restricción: Establecemos las distintas restricciones de precedencia
constraint inicio[2] > fin[1];    % predecesoras de B: A
constraint inicio[3] > fin[2];    % predecesoras de C: B
constraint inicio[4] > fin[1];    % predecesoras de D: A
constraint inicio[5] > fin[3] /\ inicio[5] > fin[4];    % predecesoras de E: C,D
constraint inicio[6] > fin[3] /\ inicio[6] > fin[4] /\ inicio[6] > inicio[5];    % predecesoras de F: C,D,E
constraint inicio[7] > fin[3] /\ inicio[7] > fin[4];    % predecesoras de G: C,D
constraint inicio[8] > fin[1];    % predecesoras de H: A
constraint inicio[9] > fin[6] /\ inicio[9] > fin[8];    % predecesoras de I: F, H
constraint inicio[10] >fin[7] /\ inicio[10] > fin[9];    % predecesoras de J: G, I

% Minimizamos la duración total 
constraint duracion == max(fin);
solve minimize duracion;