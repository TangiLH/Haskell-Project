import CPL

constraint :: Formula 
constraint = And (Or (Var "p1") (Var "p2")) (Or (Var "t1") (Var "t2"))

reglement :: Formula a => a -> a -> a
reglement f1 f2 = Or (And (f1) (Not f2)) (And (Not f1) (f2))  

Formule1 :: Formula
Formule1 = And (Var "p1") (Var "t2")

Formule2 :: Formula
Formule2 = And (Or (Var "p1") (Var "p2")) (Or (Var "t1") (Var "t2"))

challenge1 :: And (reglement ())