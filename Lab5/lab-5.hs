import Data.List
import System.IO

main = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn $ "Hello " ++ name ++ " good to see you!"