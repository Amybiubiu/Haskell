-- data Bool = False | True
module Shapes
( Point(..)
,Shape(..)
,surface
) where

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)
surface:: Shape -> Float
surface (Circle _ r) = pi * r ^ 2

data Car = Car String String Int deriving (Show)
data Maybe' a = Nothing | Just a

-- Type synonyms
type String = [Char]
type PhoneBook = [(String,String)]
type AssocList k v = [(k,v)]

-- Recursive data structures
infixr 5 ++
(++) :: [a] -> [b] -> [a]
[]     ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)

-- Typeclasses
class YesNo a where
    yesno :: a -> Bool
instance YesNo Int where
    yesno 0 = false
    yesno _ = True
instance YesNo [a] where
    yesno [] = False
    yesno _ = True
-- yesno $ length []

class Functor' f where
    fmap :: (a -> b) -> f a -> f b
instance Functor' [] where
    fmap = map
map :: (a -> b) -> [a] -> [b]