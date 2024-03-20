module Cha5 (challenge5) where
import CPL

constraint :: Formula 
constraint = And (Not (Eqv(Var "p1")(Var "t1"))) (Not (Eqv(Var "p2")(Var "t2")))

reglement :: Formula 
reglement = And (And (Imp (Var "p1") (door1)) (Imp (Var "t1")(Not door1))) (And (Imp (Var "p2") (Not door2)) (Imp (Var "t2") (door2)))

door1 :: Formula
door1 = And (Imp (Var "p1")(Var "t2")) (Imp (Var "t1")(Var "p2"))

door2 :: Formula
door2 = And (Var "t2") (Var "p1")

challenge5 :: Formula
challenge5 = And reglement constraint