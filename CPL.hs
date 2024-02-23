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

reglement :: Formula a => a -> a -> a
reglement f1 f2 = Or (And (f1) (not f2)) (And (not f1) (f2))  