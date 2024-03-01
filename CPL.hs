module CPL where
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

genAllWorlds :: World -> [World]
genAllWorlds a = (genAllWorldsRec a)++genAllList a

genAllWorldsRec:: World -> [World]
genAllWorldsRec [] = []
genAllWorldsRec (x:xs) = forEachAddList x (forEachAddList x ((genAllList xs))++genAllWorldsRec xs) ++ genAllWorldsRec xs

-- ajoute a a chaque liste dans la liste, empeche les doublons
forEachAddList ::Eq a => a -> [[a]] -> [[a]]
forEachAddList _ []=[]
forEachAddList a [[]]=[[a]]
forEachAddList a (x:xs)
    |not (isInList a x)=(a:x):(forEachAddList a xs)
    |otherwise = x:(forEachAddList a xs)

testForEachAddList=[forEachAddList 1 []==[],
    forEachAddList 1 [[1],[2]]==[[1,1],[1,2]]]

isInList :: Eq a => a -> [a] -> Bool
isInList _ []=False
isInList a (x:xs)
    |a==x=True
    |otherwise=isInList a xs

testIsInList=[isInList 5 []==False,
    isInList 4 [1,2]==False,
    isInList 4 [1,2,3,4]==True]

genAllList:: [a] -> [[a]]
genAllList []=[]
genAllList (x:xs)=[x]:(genAllList xs)