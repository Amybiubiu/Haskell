-- tuple
addVectors :: (Num a)=>(a,a)->(a,a)->(a,a)
-- addVector a b = (fst a + fst b,snd a + snd b)
addVectors (x1,y1) (x2,y2) = (x1+x2,y1+y2)

first :: (a,b,c)->a
first (x,_,_) = x

myCompare :: (Ord a)=>a->a->Ordering

a `myCompare` b
    | a > b = GT
    | a == b = EQ
    | otherwise = LT

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I" 
    | bmi <= fat = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

initials :: String -> String -> String
initials (f:_) (l:_) = [f] ++ ". " ++ [l] ++ "."  