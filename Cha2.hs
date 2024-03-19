module Cha2 (challenge2) where
import CPL

constraint :: Formula 
constraint= And (Not (Eqv(Var "p1")(Var "t1"))) (Not (Eqv(Var "p2")(Var "t2")))

reglement :: Formula -> Formula -> Formula 
reglement f1 f2 = Or (And (f1) (f2)) (And (Not f1) (Not f2))  

door1 :: Formula
door1 =  Or (Var "p1") (Var "p2")

door2 :: Formula
door2 = Var "t1"

challenge2 :: Formula
challenge2 = And (reglement door1 door2) constraint
