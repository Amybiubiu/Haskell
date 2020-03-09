take' :: (Num i,Ord i) => i -> [a] -> [a]
take' i _
    | i <= 0 = []
take' _ [] = []
take' i (x:xs) = x : take' (i-1) xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [ a | a <- xs , a <= x]
        biggerSorted = quicksort [a | a <- xs , a > x]
    in smallerSorted ++ [x] ++ biggerSorted