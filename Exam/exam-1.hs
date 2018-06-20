{-# LANGUAGE FlexibleInstances #-}
import Test.HUnit

-- IMIĘ I NAZWISKO: _________________

-----------------------------------------------------------------------------

-- SEKCJA 1: PROSTE LISTY NA ROZGRZEWKĘ

-- [7.5%] ZADANIE 1.A
-- Napisz funkcję, która wyciąga elementy znajdujące się na parzystych
-- pozycjach w zadanej liście
-- Przykład:
-- ghci> parzyste [2, 5, 6, 13, 32]
-- [5, 13]

parzyste :: [Int] -> [Int]
parzyste [] = []
parzyste [_] = []
parzyste (x:x':xs) = x':(parzyste xs)

--------------------------------------

-- [7.5%] ZADANIE 1.B
-- Napisz funkcję, która przyjmuje dwa argumenty: START oraz ILE
-- i zwraca listę zawierającą kwadraty kolejnych liczb całkowitych
-- poczynając od liczby START. Lista powinna zawierać ILE liczb
-- Przykład:
-- ghci> kwadraty 3 4
-- [9, 16, 25, 36]
-- ghci> kwadraty 0 2
-- [1, 4]
-- ghci> kwadraty 2 0
-- []
kwadraty :: Int -> Int -> [Int]
kwadraty x n = map (\e -> e^2) [x..x+n-1]

-----------------------------------------------------------------------------

-- SEKCJA 2: MAP

-- [15%] Zdefiniuj rekurencyjną funkcję podwojnaMapa, która przyjmuje dwie
-- funkcje oraz listę i aplikuje funkcję pierwszą do elementów nieparzystych,
-- a funkcję drugą do parzystych elementów listy
-- Przykład:
-- ghci> 
-- [11, 102, 13, 104, 15]
podwojnaMapa :: (a -> b) -> (a -> b) -> [a] -> [b]
podwojnaMapa _ _ [] = []
podwojnaMapa f g (x:xs) = (f x) : podwojnaMapa g f xs 



-----------------------------------------------------------------------------

-- SEKCJA 3: NATURALNA

-- Dany jest typ reprezentujący liczby naturalne:
data Naturalna = Zero | Kolejna Naturalna
    deriving Show
-- (definiowane są jako zero albo jako coś co jest kolejną liczbą po innej
-- liczbie naturalnej)


-- [5%] ZADANIE 3.1
-- Zdefiniuj funkcję, która transformuje daną liczbę typu Naturalna na
-- odpowiadającego jej Inta
-- Przykład:
-- ghci> naturalnaToInt (Kolejna (Kolejna (Kolejna Zero)))
-- 3
naturalnaToInt :: Naturalna -> Int
naturalnaToInt Zero = 0;
naturalnaToInt (Kolejna x) = 1 + naturalnaToInt x;

--------------------------------------

-- [10%] ZADANIE 3.2
-- Chcemy również dokonywać konwersji w drugą stronę: z dowolnego typu
-- na typ Naturalna. W tym celu:
-- (a) stwórz type-class (a.k.a. interfejs) Naturalable (oznaczający,
-- że coś da się zamienić na typ Naturalna) definiujący funkcję toNaturalna,
-- która dokonuje właściwej konwersji
-- (b) zdefiniuj taką konwersję (z wykorzystaniem Naturalable) dla typu Int
-- Przykład (musimy jawnie podać typ Int!):
-- ghci> toNaturalna (3 :: Int)
-- Kolejna (Kolejna (Kolejna Zero))
class Naturalable a where
    toNaturalna :: a -> Naturalna

instance Naturalable Int where
    toNaturalna 0 = Zero
    toNaturalna x = Kolejna $ toNaturalna (x-1)

--------------------------------------

-- [10%] ZADANIE 3.3
-- Zdefiniuj funkcję dodającą dwie liczby Naturalne (dodawanie powinno być
-- wykonywane na typie Naturalna! Nie dopuszczalne jest rozwiązanie, w którym
-- dokonujemy konwersji na Int i wykorzystujemy dodawanie na Intach)
-- Przykład:
-- ghci> dodaj (Kolejna (Kolejna Zero)) (Kolejna (Kolejna (Kolejna Zero)))
-- Kolejna (Kolejna (Kolejna (Kolejna (Kolejna Zero))))
-- -- Zakładając, że wcześniejsze konwersje też działają:
-- ghci> naturalnaToInt (dodaj (toNaturalna (3::Int)) (toNaturalna (5::Int)))
-- 8
dodaj :: Naturalna -> Naturalna -> Naturalna
dodaj x Zero = x
dodaj x (Kolejna y) = dodaj (Kolejna x) y

-----------------------------------------------------------------------------

-- SEKCJA 4: FOLD

-- [20%] ZADANIE 4
-- Napisz funkcję mojFiltr korzystajac z foldr/foldl.
-- Funkcja powinna mieć taką samą funkcjonalność jak wbudowana funkcja filter
mojFiltr :: (a -> Bool) -> [a] -> [a]
mojFiltr f list = foldr (\x acc -> if (f x) == True then x:acc else acc) [] list

-----------------------------------------------------------------------------

-- SEKCJA 5: TESTY

-- [5*5%] Zdefiniuj testy jednostkowe do wybranych 5 zadań z kolokwium.
-- Dla każdego zadania powinny być dwa testy. Jeden z nich może być przykładem
-- zaczerpniętym z opisu zadania, drugi test wymyśl samodzielnie.
-- Zdefiniuj również funkcję uruchomTesty, która uruchamia zestaw wszystkich
-- przygotowanych przez ciebie testów.

testlist1a = TestList ["[]" ~: parzyste [] ~?= []
    , "[2, 5, 6, 13, 32]" ~: parzyste [2, 5, 6, 13, 32] ~?= [5, 13]
    , "[2, 5, 6, 13, 32, 64]" ~: parzyste [2, 5, 6, 13, 32, 64] ~?= [5, 13, 64]
                    ]

testlist1b = TestList ["kwadraty 3 4" ~: kwadraty 3 4 ~?= [9,16,25,36]
    , "kwadraty 2 0" ~: kwadraty 2 0 ~?= []
    , "kwadraty 4 1" ~: kwadraty 4 1 ~?= [16]
                    ]

testlist2 = TestList ["podwojnaMapa 1" ~: podwojnaMapa (+10) (+100) [1, 2, 3, 4, 5] ~?= [11,102,13,104,15]
    , "podwojnaMapa 2" ~: podwojnaMapa (*10) (+100) [3, 4, 5] ~?= [30,104,50]
                    ]

testlist3 = TestList ["naturalnaToInt 1" ~: naturalnaToInt (Kolejna (Kolejna (Kolejna Zero))) ~?= 3
    , "naturalnaToInt 2" ~: naturalnaToInt Zero ~?= 0
                    ]

testlist4 = TestList ["mojFiltr 1" ~: mojFiltr (\x -> x >= 4) [1,2,3,4,5,6] ~?= [4,5,6]
    , "mojFiltr 2" ~: mojFiltr (\x -> (x `mod` 2) == 0) [1,2,3,4,5,6] ~?= [2,4,6]
                    ]

uruchomTesty :: IO ()
uruchomTesty = do
    runTestTT testlist1a
    runTestTT testlist1b
    runTestTT testlist2
    runTestTT testlist3
    runTestTT testlist4
    return ()