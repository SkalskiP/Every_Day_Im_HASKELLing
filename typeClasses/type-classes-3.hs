import Data.List
import System.IO

-- Typeclasses 102
-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses#algebraic-data-types

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where  
    Red == Red = True  
    Green == Green = True  
    Yellow == Yellow = True  
    _ == _ = False

instance Show TrafficLight where  
    show Red = "Red light"  
    show Yellow = "Yellow light"  
    show Green = "Green light"