import Data.List
import System.IO

sum2c :: Int -> Int -> Int
sum2c m n = m + n

dodaj1 :: Int -> Int
dodaj1 = sum2c 1

dodaj1doListy :: [Int] -> [Int]
dodaj1doListy = map dodaj1

-- ------------------------------------------------------------------------

mojeLiczby = [f x | x <- lista, p x]
             where f = \a -> 2 * a          -- f mnoży liczbę razy 2
                   lista = [1..10]          -- lista początkowa
                   p = \b -> b `mod` 2 == 0 -- p wybiera liczby parzyste
 
mojeLiczby' = map f $ filter (p) lista
             where f = \a -> 2 * a          
                   lista = [1..10]          
                   p = \b -> b `mod` 2 == 0

-- ------------------------------------------------------------------------

-- generatorOperator :: (Int -> Int) -> Int -> Int
generatorOperator operator x = operator x
dodaj3 = generatorOperator (+) 3
podziel100 = generatorOperator (/) 100

-- ------------------------------------------------------------------------

myReverse :: String -> String
myReverse xs = foldl (\acc x-> x : acc) [] xs

-- ------------------------------------------------------------------------

policzISumuj :: (Int -> Int) -> Int -> Int -> Int
policzISumuj func start end = sum $ map func [start..end]

-- ------------------------------------------------------------------------

pierwsze :: [Int] -> [Int]
pierwsze xs = filter (\x -> length(filter (\n -> x `mod` n == 0) [1..x]) == 2) xs