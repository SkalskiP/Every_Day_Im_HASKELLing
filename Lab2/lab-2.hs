import Data.List
import System.IO

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- ------------------------------------------------------------------------

sign :: Double -> Double
sign x | x > 0  = 1
       | x == 0 = 0
       | x < 0 = -1

signWithIf :: Double -> Double
signWithIf x = if x > 0 
                    then 1
                    else if x == 0
                        then 0
                        else -1

signWithOtherwise :: Double -> Double
signWithOtherwise x | x > 0 = 1
                    | x == 0 = 0
                    | otherwise = -1

-- ------------------------------------------------------------------------

sum2a :: (Int, Int) -> Int
sum2a (m, n) = m + n

sum2b :: [Int] -> Int
sum2b (m:n:_) = m + n

sum2c :: Int -> Int -> Int
sum2c m n = m + n

-- ------------------------------------------------------------------------

myZip :: [a] -> [b] -> [(a, b)]
myZip (a' : a) (b' : b) = (a', b') : myZip a b
myZip _ _ = []

-- ------------------------------------------------------------------------

bakteria :: Int -> (Int, Int)
bakteria 0 = (1,1)
bakteria n = (snd (bakteria (n-1)), 2 * (fst (bakteria (n-1))) + (snd (bakteria (n-1))))

-- ------------------------------------------------------------------------

-- helper function converting number into list of digits
digs :: Int -> [Int]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

-- supercyfra 
supercyfra :: Int -> Int
supercyfra x = if length (digs x) == 1 
                then x
                else supercyfra (sum (digs x))

-- ------------------------------------------------------------------------

-- helper function to remove char from string
removeChar :: Char -> [Char] -> [Char]
-- removeChar a list =  filter (/=a) list
removeChar a list = [elem | elem <- list, elem /= a]

-- usunduplikaty
usunduplikaty :: [Char] -> [Char]
usunduplikaty [] = []
usunduplikaty (a': a) | elem a' a = a' : (usunduplikaty (removeChar a' a))
                      | otherwise = a' : (usunduplikaty a)

-- ------------------------------------------------------------------------

-- helper function to calculate number of occurrences of the given number
count :: Int -> [Int] -> Int
count x [] = 0
count x (y':y) | x==y' = 1+(count x y)
               | otherwise = count x y

-- helper function to remove duplicates from list
rmdups :: [Int] -> [Int]
rmdups [] = []
rmdups (x:xs) = x : filter (/=x) (rmdups xs)

-- helper function to calculate frequency of occurrences of every number in list
frequency :: [Int] -> [(Int,Int)]
frequency list = [(count y list,y) | y <- rmdups list]

conajmniejn :: [Int] -> Int -> [Int]
conajmniejn list threshold = [y | (x,y) <- frequency list, x >= threshold]