module Cha4 (challenge4) where
import CPL

constraint :: Formula 
constraint= And (Not (Eqv(Var "p1")(Var "t1"))) (Not (Eqv(Var "p2")(Var "t2")))

reglement :: Formula -> Formula -> Formula 
reglement f1 f2 = And (And (Imp (Var "p1") (f1)) (Imp (Var "t1") (Not f1))) (And (Imp (Var "p2") (Not f2)) (Imp (Var "t2") (f2)) )

door1 :: Formula
door1 =  And (Var "p1") (Var "p2")

door2 :: Formula
door2 = Var "p1"

challenge4 :: Formula
challenge4 = And (reglement door1 door2) constraint
