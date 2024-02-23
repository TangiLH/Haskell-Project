import CPL

constraint :: Formula 
constraint = And (Or (Var "p1") (Var "p2")) (Or (Var "t1") (Var "t2"))

reglement :: Formula -> Formula -> Formula 
reglement f1 f2 = Or (And (f1) (Not f2)) (And (Not f1) (f2))  

porte1 :: Formula
porte1 = And (Var "p1") (Var "t2")

porte2 :: Formula
porte2 = And (Or (Var "p1") (Var "p2")) (Or (Var "t1") (Var "t2"))

challenge1 :: Formula
challenge1 = And (reglement porte1 porte2) constraint