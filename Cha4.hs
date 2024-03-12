import CPL

constraint :: Formula 
constraint =And (And (And (Imp (Var "p1") (Not (Var "t1"))) (Imp (Var "t1") (Not (Var "p1")))) (And (Imp (Var "p2") (Not (Var "t2"))) (Imp (Var "t2") (Not (Var "p2"))))) (And (Or (Var "p1") (Var "t1")) (Or (Var "p2")(Var "t2")) )

reglement :: Formula -> Formula -> Formula 
reglement f1 f2 = And (And (Imp (Var "p1") (f1)) (Imp (Var "t1") (Not f1))) (And (Imp (Var "p2") (Not f2)) (Imp (Var "t2") (f2)) )

porte1 :: Formula
porte1 =  And (Var "p1") (Var "p2")

porte2 :: Formula
porte2 = Var "p1"

challenge4 :: Formula
challenge4 = And (reglement porte1 porte2) constraint