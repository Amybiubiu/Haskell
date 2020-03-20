multThree:: (Num a)=> a -> a -> a -> a
multThree x y z = x*y*z

applyTwice:: (a->a) -> a -> a
applyTwice f x = f (f x)

map':: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

annoy = 
    let notNull x = not (null x)
    in filter notNull [[1,2,3],[],[3,4,5]]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x       = x : filter' p xs
    | otherwise = filter' p xs

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [10000,9999..])
    where p x = x `mod` 3829 == 0

listOfFuns :: (Num a) => [a->a]
listOfFuns = map (*) [0..]
-- (listOfFuns !! 4) 5

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x

-- foldl 关键字
sum' :: (Num a) => [a] -> a
-- 函数的柯里化
sum' = foldl (+) 0
-- sum' xs = foldl (\acc x -> acc + x) 0 xs

-- foldr 关键字
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
-- map' (+3) [1,2,3]
