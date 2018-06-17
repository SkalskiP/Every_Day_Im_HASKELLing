import Data.List
import System.IO

-- https://www.youtube.com/watch?v=v5AukLriIh8&index=2&list=PL0zVEGEvSaeG37ziHqYumYgvJDBn1Wsap


doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

-- ------------------------------------------------------------------------

doubleSmallNumber x = if x > 100
    then x
    else x * 2