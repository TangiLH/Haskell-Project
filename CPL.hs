module CPL where
data Formula = T 
    |   F 
    |   Var String
    |   And Formula Formula
    |   Or Formula Formula
    |   Not Formula
    |   Imp Formula Formula
    |   Eqv Formula Formula
    deriving Show

data World = [] | String : World
    deriving Show

genAllWorlds:: World -> [World]
genAllWorlds [] = []
genAllWorlds x:xs = x : genAllWorlds xs
