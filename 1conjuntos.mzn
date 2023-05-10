include "globals.mzn";

% Conjuntos 
set of int: S = {1,1,2};
set of int: POS = 1..3; 
%set of int: S = {1,2,3,4,5,6};
%set of int: POS = 1..6; 
%set of int: S = {1,1,2,4,4,5,6,7,8};
%set of int: POS = 1..9; 
%set of int: S = {99,14,82,47,82,50,77,45,23,92,52,90,46,57,29,25,74,25,30,70};
%set of int: POS = 1..20; 
%set of int: S = {35,82,97,30,38,78,18,39,35,93,49,47,30,57,43,21,92,51,89,80};
%set of int: POS = 1..20; 
%set of int: S = {60,8,11,2,49,69,87,15,62,72,89,14,76,63,45,92,74,80,11,2};
%set of int: POS = 1..20; 

% Representación de la solución
array [POS] of var 0..1: S1;
array [POS] of var 0..1: S2;
var int: resta; 

%constraint resta == sum(i in POS)(S[i]*subsets[i]) - sum(i in POS)((1-S[i])*subsets[i]);
constraint resta = sum(i in POS)(S[i]+subsets[i]);

constraint resta >= 0; 

solve minimize resta; 
%output ["\(subsets[i]) " | i in POS] ++ ["\n"]