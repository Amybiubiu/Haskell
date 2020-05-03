# Haskell

## Types and Typeclasses

### system typeclasses

| Typeclassed |       Types      |   Function  |
| :---------: |       :---:      |   :---:  |
| Eq | 除函数以外的所有类型 | ==, /=|
| Ord | 除函数以外的所有类型 | >, <, >=, <=, compare |
| Show | 除函数以外的所有类型 | show |
| Read | 非show | read |
| Enum | (), Bool, Char, Ordering, Int, Integer, Float 和 Double | succ,pred |
|Bounded | - | minBound,maxBound |
| Num | 包括实数和整数 | - |
| Integral | Int(有界整数),Integer(无界整数)| - |
| Floating | Float,Double | fromIntergal |

### construct typeclasses

```hs
-- Type
data Bool = False | True
data Int = -217483648 | -217483647 | ... | -1 | 0 | 1 | 2 | ... | 2147483647

{--
 Circle 是包含参数的值构造子 🆚 False 是不含参数的值构造子.值构造子是个函数  
 ghci>:t 5  
 5::(Num t) => t
--}
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

-- Record Syntax
data Person = Person String String Int deriving (Show)
firstName :: Person -> String
firstName (Person firstname _ _) = firstname

data Person = Person { fistName::String, lastName::String, age::Int } deriving (Show)

-- Type parameters
data Maybe a = Noting | Just a -- a 作为Type variable 实现多态
data Either a b = Left a | Right b deriving (Eq,Ord,Read,Show)  -- 这两个类型的理解有些复杂
data Person a b c = Rerson {firstName::a,lastName::b,age::c}

-- Type synonyms (类型别名)
type String = [Char]
type Phone = [(String,String)]
type AssocList k v = [(k,v)]    -- AssocList 是个类型构造子和 Maybe 类似

-- recursive data structure
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

-- Typeclasses
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y = not (x /= y)
    x /= y = not (x == y)
instance Eq TraffivLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ False
    -- Red == Red >True

class YesNo a where
    yesno :: a -> Bool
instance YesNo Int where
    yesno 0 = False
    yesno _ = True

class Functor f where
    fmap :: (a -> b) -> f a -> f b
instance Functor [] where
    fmap :: (a -> b) -> [a] -> [b]
```

## Function Syntax

```hs
-- Pattern match（超级喜欢这种特性）是case的语法糖
lucky :: (Intergral a) => a -> String
lucky 7 = "Lucky"
lucky x = "Sorry,you're out of luck"

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)   -- Tuple

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ "and" ++ show y
    -- 另有 (x:xs) (_:xs) (x, _, _) 等等 可自定义匹配规则

-- Guards
max' :: (Ord a) => a -> a -> a
max' a b
    | a>b = a
    | otherwise = b

-- Where
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname  -- where 中也可以使用模式匹配

-- Let （与 Where 的区别是Let只在guard内可见, where 在函数内可见
ylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h   -- let 内也可以使用模式匹配
        topArea = pi * r ^2
    in  sideArea + 2 * topArea

-- curried functions
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z
mulThree 3 5 9  -- ((mulThree 3) 5) 9
-- 首先，按照空格分隔，把 3 交给 mulThree。这返回一个返回函数的函 数。然后把 5 交给它，返回一个取一个参数并使之乘以 15 的函数。最后把 9 交给这一函数，返回 135
-- multThree :: (Num a) => a -> (a -> (a -> a))
-- (Num a) => a -> (a -> a)
-- (Num a) => a -> a

-- lambda
flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x    -- curringfy （与 flip' f x y = f y x 等价

-- $ and function composition
($) :: (a -> b) -> a -> b
f $ x=f x   --具有最低优先级 用来省括号

(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)   -- 用来函数组合
```

## Modules

### List

### Char

### Map

### Set

### construct modules

## IO

## Monad