module Cha1 (challenge1) where
import CPL

constraint :: Formula 
constraint= And (Not (Eqv(Var "p1")(Var "t1"))) (Not (Eqv(Var "p2")(Var "t2")))

reglement :: Formula 
reglement = Or (And (door1) (Not door2)) (And (Not door1) (door2))  

door1 :: Formula
door1 = And (Var "p1") (Var "t2")

door2 :: Formula
door2 = And (Or (Var "p1") (Var "p2")) (Or (Var "t1") (Var "t2"))

challenge1 :: Formula
challenge1 = And reglement constraint