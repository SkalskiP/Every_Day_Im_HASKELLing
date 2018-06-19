import Data.List
import System.IO

-- Type Classes

data Employee = Employee { name :: String,
                           position :: String,
                           idNum :: Int
                           } deriving (Eq, Show)

samSmith = Employee {name = "Sam Smith", position = "Manager", idNum = 1000}
pamMarx = Employee {name = "Pam Marx", position = "Sales", idNum = 1001}

isSamPam = samSmith == pamMarx

samSmithData = show samSmith

-- Type Instance

data ShortSize =  S | M | L

instance Eq ShortSize where
    S == S = True
    M == M = True
    L == L = True
    _ == _ = False

instance Show ShortSize where
    show S = "Small"
    show M = "Medium"
    show L = "Large"

smallAvail = S `elem` [S, M, L]

theSize = show S

-- Custom Typeclass

class MyEq a where
    areEqual :: a -> a -> Bool

instance MyEq ShortSize where
    areEqual S S = True
    areEqual M M = True
    areEqual L L = True
    areEqual _ _ = False

newSize = areEqual M M

-- File I/O

sayHello = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn $ "Hello " ++ name

-- ------------------------------------------------------------------------

writeToFile = do
    theFile <- openFile "test.txt" WriteMode
    hPutStrLn theFile ("Random line of text")
    hClose theFile

-- ------------------------------------------------------------------------

readFromFile = do
    theFile2 <- openFile "test.txt" ReadMode
    contents <- hGetContents theFile2
    putStr contents
    hClose theFile2

-- Fibonacci Sequence

fib =  1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]
fib300 = fib !! 300