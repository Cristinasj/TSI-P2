int : N = 5; 
array [1..N] of var int: marcas;

constraint marcas[1] = 0; 

constraint forall(i in 2..N)(
  marcas[i] = marcas[i-1] - marcas[1] + 1 + marcas[i-1]
  ); 