import Data.List
import System.IO

-- Record syntax
-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses#algebraic-data-types

-- data Person = Person String String Int Float String String deriving (Show)

data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     , height :: Float  
                     , phoneNumber :: String  
                     , flavor :: String  
                     } deriving (Show)

-- ------------------------------------------------------------------------

-- data Car = Car String String Int deriving (Show) 

data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)

-- Type parameters

-- When declaring a data type, the part before the = is the type constructor and the 
-- constructors after it (possibly separated by |'s) are value constructors.

data Vector a = Vector a a a deriving (Show)  
  
vplus :: (Num t) => Vector t -> Vector t -> Vector t  
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)  
  
vectMult :: (Num t) => Vector t -> t -> Vector t  
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
  
scalarMult :: (Num t) => Vector t -> Vector t -> t  
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n  