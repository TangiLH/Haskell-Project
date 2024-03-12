module Cha2 (challenge2) where
import CPL

constraint :: Formula 
constraint =And (And (And (Imp (Var "p1") (Not (Var "t1"))) (Imp (Var "t1") (Not (Var "p1")))) (And (Imp (Var "p2") (Not (Var "t2"))) (Imp (Var "t2") (Not (Var "p2"))))) (And (Or (Var "p1") (Var "t1")) (Or (Var "p2")(Var "t2")) )

reglement :: Formula -> Formula -> Formula 
reglement f1 f2 = Or (And (f1) (f2)) (And (Not f1) (Not f2))  

porte1 :: Formula
porte1 =  Or (Var "p1") (Var "p2")

porte2 :: Formula
porte2 = Var "t1"

challenge2 :: Formula
challenge2 = And (reglement porte1 porte2) constraint
