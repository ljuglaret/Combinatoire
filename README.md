module Combinatoire exposing(choices,split)

{-| Cette bibliothèque fournit les outils nécessaires pour produire toutes les combinaisons d'une liste d'entiers

## Fonctions
@docs split , choices

- }

split : List Int -> List((List Int ),(List Int ))
split[1,2,3,4] == [([1],[2,3,4]),([1,2],[3,4]),([1,2,3],[4])]

choices : List Int -> List(List Int )
choices [1,2,3] == 
[[],[3],[2],[2,3],[3,2],[1],[1,3],[3,1],[1,2],[2,1],[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]