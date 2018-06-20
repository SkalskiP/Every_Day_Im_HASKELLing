
import Data.List (sortBy)
import Text.Read (readMaybe) 
import Data.Maybe
import Data.Char
import Data.Map (Map)
import qualified Data.Map

-- Zad. 1,2,3

data Student = Student 
  { id :: Int
  , name :: String
  , dateOfBirth :: String
  } deriving (Show, Eq)

data Score = Score 
  { studentId :: Int
  , course1Score :: Int
  , course2Score :: Int
  , course3Score :: Int
  } deriving (Show, Eq)

data StudentWithScores = StudentWithScores
  { studentWithScoreId :: Int
  , studentWithScorename :: String
  , studentWithScoredateOfBirth :: String
  , studentWithScorecourse1Score :: Int
  , studentWithScorecourse2Score :: Int
  , studentWithScorecourse3Score :: Int
  } deriving (Show)

-- Zad. 4

students :: [Student]
students = [Student 26453 "Kristalee Copperwaite" "2000", Student 33596 "Roeberta Naden" "1997"]

scores :: [Score]
scores = [Score 26453 93 97 80, Score 40241 93 97 80, Score 33596 82 60 80]

-- Note: quicksort in Haskell
-- ------------------------------------------------------------------------
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]
-- ------------------------------------------------------------------------

-- studentsByNameSort :: [Student] -> [Student]
-- studentsByNameSort = sortBy $ 

-- Zad. 5

toStudentWithScores :: Student -> Score -> Maybe StudentWithScores
toStudentWithScores (Student id name dateOfBirth) (Score studentId score1 score2 score3)
    | id == studentId = Just $ StudentWithScores id name dateOfBirth score1 score2 score3
    | otherwise = Nothing

-- Zad. 6

findById :: [Score] -> Int -> [Score]
findById scores id = filter (\x -> (studentId x) == id) scores

-- Zad. 7

findBy :: (Score -> Bool) -> [Score] -> [Score]
findBy f scrs = filter f scrs

-- Zad. 8

mapBy :: (Score -> a) -> [Score] -> [a]
mapBy f scrs = map f scrs

-- Zad. 9

reduceBy :: ([a] -> Score -> [a]) -> [Score] -> [a]
reduceBy f scrs = foldl f [] scrs

-- Zad. 10

mapToJoin :: Student -> [Score] -> [Maybe StudentWithScores]
mapToJoin singleStudent scoresList = map (toStudentWithScores singleStudent) scoresList

-- Zad. 11

joinStep1 :: [Student] -> [Score] -> [(Student, [Score])]
joinStep1 studentList scoresList = map (\student -> (student, scoresList)) studentList

-- Zad. 12

-- joinStep2 :: [(Student, [Score])] -> [[Maybe StudentWithScores]]
-- joinStep2 list = map (\(student, scores) -> mapToJoin student scores -> mapToJoin ) list

-- Zad. 13

-- Zad. 14

-- Zad. 15

class (Ord a) => Id a where
    toInt :: a -> Int

-- Zad. 16

class HasId a where
    getId :: (Id b) => a b -> b

-- Zad. 20

reverseString :: [Char] -> [Char]
reverseString xs = foldl (\acc x -> x:acc) [] xs

toUpperString :: [Char] -> [Char]
toUpperString xs = map (\x -> toUpper x) xs

hello = do
  putStrLn "What's your name?"
  name <- getLine
  putStrLn $ toUpperString name ++ " hello"
  putStrLn $ "goodbye " ++ reverseString name