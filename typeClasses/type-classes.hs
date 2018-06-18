{-# LANGUAGE FlexibleInstances #-}
import Data.Char
import Data.List
import System.IO

-- https://en.wikibooks.org/wiki/Haskell/Classes_and_types

-- Classes and instances and deriving

data Foo = Foo {x :: Integer, str :: String}
    deriving (Eq, Ord, Show)
 
-- instance Eq Foo where
--    (Foo x1 str1) == (Foo x2 str2) = (x1 == x2) && (str1 == str2)
