module Cha6 (challenge6) where
import CPL

constraint:: Formula
constraint= And (And (Not (Eqv(Var "p1")(Var "t1"))) (Not (Eqv(Var "p2")(Var "t2")))) (Not (Eqv(Var "p3")(Var "t3")))

reglement :: Formula
reglement = And(And (And (Imp door1 (And (Not door2)(Not door3)))
    (Imp door2 (And (Not door1)(Not door3))))
    (Imp door3 (And (Not door2)(Not door1))))
    (And (And (Imp (Var "p1") (And (Not (Var "p2"))(Not (Var "p3"))))
    (Imp (Var "p2") (And (Not (Var "p1"))(Not (Var "p3")))))
    (Imp (Var "p3") (And (Not (Var "p2"))(Not (Var "p1")))))
    

testf::Formula
testf=And(And(Or(Var "p1")(Var "p3"))(Not(And(Var "p1")(Var "p3"))))(Not(And(And(Var "p1")(Var "p2"))(Var "p3")))

testff::Formula
testff=And testf constraint

door1 :: Formula
door1= Var "t1"

door2 :: Formula
door2=Var "p2"

door3 :: Formula
door3 = Var "t2"

challenge6 :: Formula
challenge6 = And reglement constraint