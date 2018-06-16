import Data.List
import System.IO

-- addMe function
-- type declaration
addMe :: Int -> Int -> Int
-- funcName param1 param2 = operations (returned value)
addMe x y = x + y

-- ------------------------------------------------------------------------

addTyples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTyples (x, y) (x2, y2) = (x + x2, y + y2)

-- ------------------------------------------------------------------------

whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You're an adult"
whatAge _ = "Nothing Important"

-- ------------------------------------------------------------------------

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- ------------------------------------------------------------------------

prodFact n = product [1..n]