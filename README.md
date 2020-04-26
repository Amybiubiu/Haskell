# Haskell

## Types and Typeclasses

### system typeclasses

| Typeclassed |       Types      |   Function  |
| :---------: |       :---:      |   :---:  |
| Eq | 除函数以外的所有类型 | == /=|
| Ord | 除函数以外的所有类型 | > < >= <= compare |
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

-- Circle 是包含参数的值构造子 🆚 False 是不含参数的值构造子.值构造子是个函数  
-- ghci>:t 5  
-- 5::(Num t) => t
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

-- Record Syntax
data Person = Person String Sting Int deriving (Show)
firstName :: Person -> String
firstName (Person firstname _ _) = firstname

data Person = Person { fistName::String, lastName::String, age::Int } deriving (Show)

-- Type parameters
data Maybe a = Noting | Just a -- a 作为Type variable 实现多态
data Either a b = Left a | Right b deriving (Eq,Ord,Read,Show)  --这两个类型的理解有些复杂
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

```

## Modules

### List

### Char

### Map

### Set

### construct modules

## IO

## Monad