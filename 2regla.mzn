include "globals.mzn"; 
int : N = 10; 
array [1..N] of var int: marcas;

constraint marcas[1] = 0; 

% Las marcas deben de tener valores positivos 
constraint forall(i in 2..N)(marcas[i] > 0);

% Las distancias entre todos los valores tienen que ser diferentes 
constraint all_different(marcas); 
constraint forall(j in 0..N-3)(
  forall(i in 1..N-j-2)(
    forall(k in 0..N-j-2)(
      forall(l in 0..N-j-2)(
        if (l != i) then marcas[N-j] - marcas[N-j-1-l] != marcas[N-j-k] - marcas[N-j-i-1] endif
      )
    )
  )
); 

% Las marcas van de menor a mayor 
constraint forall(i in 2..N)(marcas[i] > marcas[i-1]);
solve minimize marcas[N]; 