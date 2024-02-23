data Formula = T 
    |   F 
    |   Var String
    |   And Formula Formula
    |   Or Formula Formula
    |   Not Formula
    |   Imp Formula Formula
    |   Eqv Formula Formula
    deriving Show

constraint :: Formula
constraint = And (Or (Var "p1") (Var "p2")) (Or (Var "t1") (Var "t2"))