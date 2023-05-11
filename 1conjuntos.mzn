include "globals.mzn";

% Conjuntos 
%set of int: POS = 1..3; 
%array [POS] of int: S = [1,1,2];
%set of int: POS = 1..6; 
%array [POS] of int: S = [1,2,3,4,5,6];
%set of int: POS = 1..9; 
%array [POS] of int: S = [1,1,2,4,4,5,6,7,8];

set of int: POS = 1..20; 
%array [POS] of int: S = [99,14,82,47,82,50,77,45,23,92,52,90,46,57,29,25,74,25,30,70];
%array [POS] of int: S = [35,82,97,30,38,78,18,39,35,93,49,47,30,57,43,21,92,51,89,80];
array [POS] of int: S = [60,8,11,2,49,69,87,15,62,72,89,14,76,63,45,92,74,80,11,2];

% Representación de la solución
% 1: Subset 1 
% 0: Subset 2
array [POS] of var 0..1: subsets;
var int: resta; 
var int: suma; 

% Subsets tiene valores de 0 y 1. Al sumar los valores multiplicados por 1 o (1-subsets[i]) estamos sumando los subsets por separado
constraint resta == sum(i in POS)(S[i]*subsets[i]) 
- sum(i in POS)(S[i]*(1-subsets[i]));

constraint resta >= 0; 
constraint suma == sum(i in POS)(S[i]*subsets[i]); 

solve minimize resta; 
output [ "S1: {"] ++ [ if fix(subsets[i])==1 then "\(S[i])," else "" endif | i in POS ] ++
[ "}\nS2: {"] ++ [ if fix(subsets[i])==0 then "\(S[i])," else "" endif | i in POS ] ++ ["}\nResta: \(resta) Suma: \(suma)"];