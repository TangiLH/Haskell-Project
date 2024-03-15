module CPL (Formula (..), World, genAllWorlds, testGenAllWorlds, sat, testSat, findWorlds, testFindWorlds, testAll) where 
data Formula = T 
    |   F 
    |   Var String
    |   And Formula Formula
    |   Or Formula Formula
    |   Not Formula
    |   Imp Formula Formula
    |   Eqv Formula Formula
    deriving Show

type World = [String]

--genere tout les mondes possibles d'apres un monde (toutes les combinaisons)
genAllWorlds :: World -> [World]
genAllWorlds a = (genAllWorldsRec a)++genAllList a ++ [[]]

testGenAllWorlds::[Bool]
testGenAllWorlds=[listIsInList (genAllWorlds ["a","b","c"]) ([["a"],["b"],["c"],["a","b"],["a","c"],["b","c"],["a","b","c"],[]])]

--fonction auxilliaire récursive de genAllWorlds
genAllWorldsRec:: World -> [World]
genAllWorldsRec [] = []
genAllWorldsRec (x:xs) = forEachAddList x (forEachAddList x ((genAllList xs))++genAllWorldsRec xs) ++ genAllWorldsRec xs

testGenAllWorldsRec :: [Bool]
testGenAllWorldsRec = [genAllWorldsRec ["a"]==[],
    genAllWorldsRec ["a","b"]==[["a","b"]],
    genAllWorldsRec ["a","b","c"]==[["a","b"],["a","c"],["a","b","c"],["b","c"]]]

-- ajoute a a chaque liste dans la liste, empeche les doublons
forEachAddList ::Eq a => a -> [[a]] -> [[a]]
forEachAddList _ []=[]
forEachAddList a [[]]=[[a]]
forEachAddList a (x:xs)
    |not (isInList a x)=(a:x):(forEachAddList a xs)
    |otherwise = x:(forEachAddList a xs)

testForEachAddList=[forEachAddList 1 []==[],
    forEachAddList 1 [[1],[2]]==[[1],[1,2]]]

--retourne vrai si l'element est dans la liste
isInList :: Eq a => a -> [a] -> Bool
isInList _ []=False
isInList a (x:xs)
    |a==x=True
    |otherwise=isInList a xs

testIsInList=[isInList 5 []==False,
    isInList 4 [1,2]==False,
    isInList 4 [1,2,3,4]==True]

--retourne vrai si chaque element de la premiere liste est présent au moins une fois dans la deuxieme
listIsInList :: Eq a => [a]->[a]->Bool
listIsInList [] [] = True
listIsInList _ [] = False
listIsInList [] _ = True
listIsInList (x:xs) ys = (isInList x ys) && (listIsInList xs ys)

testListIsInList :: [Bool]
testListIsInList = [(listIsInList [1,2,3] [3,1,2])==True,
    (listIsInList [1,2,3] [1,2])==False]

--retourne chaque element de la liste dans sa propre liste
genAllList:: [a] -> [[a]]
genAllList []= []
genAllList (x:xs)=[x]:(genAllList xs)

testGenAllList :: [Bool]
testGenAllList = [genAllList [1]==[[1]],
    genAllList [1,2,3]==[[1],[2],[3]]]

--verifie si le monde satisfait la formule
sat :: World -> Formula -> Bool
sat _ T = True
sat _ F = False
sat w (And f1 f2)= (sat w f1) && (sat w f2)
sat w (Or f1 f2)= (sat w f1) || (sat w f2)
sat w (Not f)= not (sat w f)
sat w (Imp f1 f2)
    |(sat w f1) && not (sat w f2)  = False
    |otherwise = True
sat w (Eqv f1 f2) = (sat w f1) == (sat w f2)
sat w (Var s)= isInList s w

testSat :: [Bool]
testSat = [ sat [""] T == True,
    sat [""] (And T F) ==False,
    sat ["a"] (Var "a")==True]

--genere la liste des variables existantes dans la formule
findVar :: Formula -> World
findVar T = []
findVar F = []
findVar  (And f1 f2)= uniq((findVar  f1) ++ (findVar  f2))
findVar  (Or f1 f2)= uniq((findVar  f1) ++ (findVar  f2))
findVar  (Not f)=uniq((findVar  f))
findVar  (Imp f1 f2)= uniq((findVar  f1) ++ (findVar  f2))
findVar  (Eqv f1 f2) = uniq((findVar  f1) ++ (findVar  f2))
findVar  (Var s)= [s]

testFindVar :: [Bool]
testFindVar = [findVar (Var "a")==["a"],
    findVar (And (Var "a")(Var "a"))==["a"],
    findVar (And (Var "a") (Var "b"))==["a","b"]]

--trouve le ou les mondes satisfaisant la formule
findWorlds:: Formula -> [World]
findWorlds f = findWorldsRec f (genAllWorlds (findVar f))

testFindWorlds :: [Bool]
testFindWorlds= [findWorlds (And (Var "a") (Var "b"))==[["a","b"]],
    findWorlds (Imp (Var "a") (Var "b"))==[["a","b"],["b"],[]]]

--fonction recursive pour findWorlds
findWorldsRec :: Formula -> [World] -> [World]
findWorldsRec _ [] = []
findWorldsRec f (w:ws)
    |(sat w f) = w:(findWorldsRec f ws)
    |otherwise =(findWorldsRec f ws)

testFindWorldsRec :: [Bool]
testFindWorldsRec = [ findWorldsRec (Imp (Var "a") (Var "b")) (genAllWorlds (findVar (Imp (Var "a") (Var "b"))))==[["a","b"],["b"],[]]]

--elimine les doublons de la liste
uniq :: Eq a => [a] -> [a]
uniq [] = []
uniq (x:xs) = x : uniq (filter (/=x) xs)

testUniq :: [Bool]
testUniq = [uniq [1,1,2,2,3,3,3,3,4]==[1,2,3,4]]

--retourne vrai si la liste de Bool contient uniquement Vrai
test:: [Bool] -> Bool
test []=True
test (x:xs)= x && test xs

testTest :: [Bool]
testTest=[test[True, True, True]==True, test[True,False]==False]

--test si toutes les fonctions de test retournent Vrai
testAll::[Char]
testAll
    |test testGenAllWorlds && test testGenAllWorldsRec && test testForEachAddList && test testIsInList && test testListIsInList && test testGenAllList && test testSat && test testFindVar && test testFindWorlds && test testFindWorldsRec && test testUniq && test testTest  = "Success !"
    |otherwise ="Failure !"
testTestAll :: [Bool]
testTestAll=[ testAll == "Success !"]