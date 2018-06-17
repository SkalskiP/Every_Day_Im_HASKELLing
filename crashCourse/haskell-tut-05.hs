import Data.List
import System.IO

-- Using guards
isOdd :: Int -> Bool
isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String
whatGrade age
    | (age >= 5) && (age <=6) = "Kindergarden"
    | (age > 6) && (age <=10) = "Elementary School"
    | (age > 10) && (age <=14) = "Middle School"
    | (age > 14) && (age <=18) = "High School"
    | otherwise = "Go to college"

-- Where clause
batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
    | avg <= 0.200 = "Terrible Batting Average"
    | avg <= 0.250 = "Average Player"
    | avg <= 0.280 = "Your doing pretty good"
    | otherwise = "You're a Superstar"
    where avg = hits / atBats

-- (x:y)
getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The fist item is " ++ show x ++ " and the rest are " ++ show xs

-- As
getFirstItem :: String -> String
getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ show x

-- Higher Order Functions
times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

-- ------------------------------------------------------------------------

areStingsEq :: [Char] -> [Char] -> Bool
areStingsEq [] [] = True
areStingsEq (x:xs) (y:ys) = x==y  && areStingsEq xs ys
areStingsEq _ _ = False

-- Pass Function into a Function

doMult :: (Int -> Int) -> Int
doMult func = func 3

num3Times4 = doMult times4

-- Returning a Function

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y

add3 = getAddFunc 3
fourPlus3 = add3 4

-- ------------------------------------------------------------------------

threePlusList = map add3 [1, 2, 3, 4, 5]

-- Lambda
dbl1To10 = map (\x -> x * 2) [1..10]

-- If
doubleEvenNumber y = 
    if (y `mod` 2 /= 0)
        then y
        else y * 2

-- Case
getClass :: Int -> String
getClass n = case n of
    5 -> "Go to Kindergarden"
    6 -> "Go to elementary school"
    _ -> "Go away"

-- .

-- sumValue = putStrLen (show (1+2))
-- sumValue = putStrLen . show $ 1 + 2