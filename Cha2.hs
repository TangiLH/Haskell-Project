module Cha2 (challenge2) where
import CPL

constraint :: Formula 
constraint= And (Not (Eqv(Var "p1")(Var "t1"))) (Not (Eqv(Var "p2")(Var "t2")))

reglement :: Formula 
reglement = Or (And (door1) (door2)) (And (Not door1) (Not door2))  

door1 :: Formula
door1 =  Or (Var "p1") (Var "p2")

door2 :: Formula
door2 = Var "t1"

challenge2 :: Formula
challenge2 = And reglement constraint
