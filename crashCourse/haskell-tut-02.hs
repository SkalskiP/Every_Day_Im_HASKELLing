import Data.List
import System.IO

-- Create a list
primeNumbers = [3,5,7,11]
-- Concatenate lists
morePrime = primeNumbers ++ [13,17,19,23,29]
-- Adding an element at beginning of the list using "cons" operator
favNums = 2 : 7 : 21 : 66 : []
-- Multidimensional lists
multiList = [[3,5,7],[11,13,17]]
-- List length
lenPrime = length primeNumbers
-- Reverse list
revPrime = reverse primeNumbers
-- Check if the list is empty
isListEmpty = null primeNumbers
-- Take element with index 2 from list (indexes numbered from zero)
secondPrime = primeNumbers !! 2
-- Take first value from list
firstPrime = head primeNumbers
-- Take last value from list
lastPrime = last primeNumbers
-- Take all but the last value from the list
primeInit = init primeNumbers
-- Take first two element from list
first2Primes = take 2 primeNumbers
-- Take all but first two element from list
removePrimes = drop 2 primeNumbers
-- Check if 7 is in the list
is7InTheList = 7 `elem` primeNumbers
-- Take maximum value from the list
maxPrime = maximum primeNumbers
-- Take minimum value from the list
minPrime = minimum primeNumbers
-- Take sum of values in the list
sumPrimes = sum primeNumbers
-- Take product of values in the list
prodPrimes = product primeNumbers
-- Generate list of numbers from zero to ten
zeroToTen = [0..10]
-- Generate list of even numbers from zero to ten
evenList = [2,4..20]
-- Generate list of other letter
letterList = ['A','C'..'Z']
-- Generate list of the same elements
many2s = take 10 (repeat 2)
many3s = replicate 10 3
-- Generate list created by repeatedly repeating elements in the list
cycleList = take 10 (cycle [1,2,3,4,5])
-- General list created by multiplying each element in the list by two
listTimes2 = [x * 2 | x <- [1..10]]
-- General list created by multiplying each element in the list by three, but smaller than 50
listTimes3 = [x * 3 | x <- [1..10], x * 3 <= 50]
-- General list of numbers divisible by 9 and 13
devisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]
-- Sorting list
sortedList = sort [9,1,8,3,4,7,6]
-- Adding together the corresponding elements from two lists
sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]
-- Filter out all numbers less than or equal to 5
listBiggerThen5 = filter (>5) primeNumbers
-- Sort of while loop
evensUpTo20 = takeWhile (<= 20) [2,4..]
-- Perform operations on all elements of the list from left to right
multOfList = foldl (*) 1 [2,3,4,5]

-- LIST COMPREHENSION

-- List created by raising all elements of the list to the 3rd power
pow3List = [3^n | n <- [1..10]]
-- Creating multiplication table
multTable = [[x * y | y <- [1..10]] | x <- [1..10]]