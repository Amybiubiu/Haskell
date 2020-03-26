-- 模式匹配
let (fw, rest) = span (/=' ') "This is a sentence" in "fistword:" ++ fw +",the rest:" ++ rest

on::(b -> b -> c) -> (a -> b) -> a -> a -> c
f `on` g = \x y -> f (g x) (g y);
-- (==)on(>0) \x y -> (x>0) == (y>0)

groupBy ((==) `on` isSpace) "hey guys its me"
-- ["hey"," ","guys"," ","its"," ","me"]

encode :: Int -> String -> String
encode shift msg =
    let ords = map ord msg 
    shifted = map (+ shift) ords 
    in map chr shifted
-- map (chr . (+ shift) . ord) msg

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing