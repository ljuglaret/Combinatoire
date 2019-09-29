module Combinatoire exposing (split,choices)
{-|
# Elm.Combinatoire
## Fonctions
@docs split ,choices 
-}

{-|
-}
interleave : Int ->  List Int -> List(List Int)
interleave x l = 
    case l of 
        [] -> [[x]]
        y::ys -> (x::y::ys)::(List.map ((::)y) (interleave x ys))

{-|-}
subs :   List Int -> List(List Int)
subs  l = 
    case l of 
        [] -> [[]]
        y::ys -> (subs ys)++(List.map ((::)y) (subs ys))
{-|
perms[4,1,2]
[[4,1,2],[1,4,2],[1,2,4],[4,2,1],[2,4,1],[2,1,4]]
-}
perms : List Int -> List (List Int ) 
perms l = 
    case l of 
        [] -> [[]]
        y::ys ->  (perms ys) |> 
                    List.concatMap (\ll -> interleave y ll )

{-|toutes les combinaisons possibles d'une suite d'entiers-}
choices : List Int -> List(List Int )
choices l = (subs l) |> 
                List.concatMap (\ll -> perms ll) 

{-| -}
split : List Int -> List((List Int ),(List Int ))
split l = 
    case l of 
        []    ->  []
        [x]   ->  [] 
        x::xs ->  ([x], xs)::(List.map
                                (\(ls,rs) -> (x::ls,rs))
                                (split xs)
                            )
        
