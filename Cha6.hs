module Cha6 (challenge6) where
import CPL

constraint:: Formula
constraint = And (And (And 
    (Imp (Var "p1") (And (And (Var "t2")(Var "t3"))(And (And (Not (Var "p2")) (Not (Var "t1")))(Not (Var "p3"))))) 
    (Imp (Var "p2") (And (And (Var "t1")(Var "t3"))(And (And (Not (Var "p1")) (Not (Var "t2")))(Not (Var "p3"))))) 
    ) 
    (And 
    (Imp (Var "p3") (And (And (Var "t2")(Var "t1"))(And (And (Not (Var "p2")) (Not (Var "t3")))(Not (Var "p1")))))  
    (And (And (Or (Var "p1") (Var "t1")) (Or (Var "p2")(Var "t2")))(Or (Var "p3") (Var "t3")))))
    (Or (Or (Var "p1")(Var "p2"))(Var "p3"))

reglement :: Formula -> Formula -> Formula -> Formula
reglement f1 f2 f3 = And (And (Imp f1 (And (Not f2)(Not f3)))
    (Imp f2 (And (Not f1)(Not f3))
    ))
    (Imp f3 (And (Not f2)(Not f1)))

door1 :: Formula
door1= Var "t1"

door2 :: Formula
door2=Var "p2"

door3 :: Formula
door3 = Var "t2"

challenge6 :: Formula
challenge6 = And (reglement door1 door2 door3) constraint