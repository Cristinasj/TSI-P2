int : N = 10; 
array [1..N] of var int: marcas;

constraint marcas[1] = 0; 

% La distancia de la última marca respecto a la penúltima marca es siempre la distancia desde la última mayor marca a la primera marca 
constraint forall(i in 2..N)(
  marcas[i] = marcas[i-1] - marcas[1] + 1 + marcas[i-1]
  ); 