{-# LANGUAGE FlexibleInstances #-}
import Data.Char
import Data.List
import System.IO

-- Definiowanie własnych type-classes

class Listable a where
    toList :: a -> [Int]
   
instance Listable Int where
    toList x = [x]
   
instance Listable Bool where
    toList True  = [1]
    toList False = [0]

-- Definiowanie własnych typów

data NamedPoint = NamedPoint
    { pointName :: String
    , pointX    :: Int
    , pointY    :: Int
    } deriving (Show)

-- Monady
maybe_sqrt :: Float -> Maybe Float
maybe_sqrt x
        | x >= 0 = Just (sqrt x)
        | otherwise = Nothing

-- Zad. 1
-- Wykorzystując wiedzę o tym jak tworzyć typeclassy, stwórz jedną o nazwie Intable, która pozwoli 
-- na konwersję [Char] to Int poprzez funkcję toInt. Użyj jej jako ograniczenie w funkcji 
-- mySuperAdd:

class Intable a where
    toInt :: a -> Int

instance Intable [Char] where
    toInt x = read x::Int

mySuperAdd :: (Intable a, Intable b) => a -> b -> Int
mySuperAdd x y = toInt x + toInt y

-- Zad. 2
-- Zbuduj nowy typ Osoba, zawierający imię, nazwisko, pesel. Napisz typeclase umożliwiającą 
-- porównywanie osób (po peselu) i sortowanie po nazwisku. Czy da się wyświetlić osobę? Co gdyby 
-- dziedziczyć po Eq i Ord? Jak zachowywałoby się porównywanie ==,<=? Poniższe powinny działać 
-- poprawnie:

data Osoba = Osoba
    { name :: String
    , surname :: String
    , pesel :: String
    } deriving (Show)

instance Eq Osoba where
   (Osoba name1 surname1 pesel1) == (Osoba name2 surname2 pesel2) = (pesel1 == pesel2)

instance Ord Osoba where
    (Osoba name1 surname1 pesel1) >= (Osoba name2 surname2 pesel2) = (name1 <= name2)
    (Osoba name1 surname1 pesel1) > (Osoba name2 surname2 pesel2) = (name1 < name2)
    (Osoba name1 surname1 pesel1) <= (Osoba name2 surname2 pesel2) = (name1 >= name2)
    (Osoba name1 surname1 pesel1) < (Osoba name2 surname2 pesel2) = (name1 > name2)