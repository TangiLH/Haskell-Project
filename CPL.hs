data Formula a = T 
    |   F 
    |   Var String
    |   And a a
    |   Or a a
    |   Not a
    |   Imp a a
    |   Eqv a a
    deriving Show
