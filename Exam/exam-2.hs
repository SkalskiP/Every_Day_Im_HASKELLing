{-# LANGUAGE FlexibleInstances #-}

-- IMIĘ I NAZWISKO:

-----------------------------------------------------------------------------

-- SEKCJA 1: PROSTE LISTY NA ROZGRZEWKĘ

-- [7.5%] ZADANIE 1.A
-- Napisz funkcję, która wyciąga elementy znajdujące się na nieparzystych
-- pozycjach w zadanej liście
-- Przykład:
-- ghci> nieparzyste [2, 5, 6, 13, 32]
-- [2, 6, 32]
nieparzyste :: [Int] -> [Int]
nieparzyste [] = []
nieparzyste [x] = [x]
nieparzyste (x:x':xs) = x:(nieparzyste xs)

--------------------------------------

-- [7.5%] ZADANIE 1.B
-- Napisz funkcję, która przyjmuje dwa argumenty: Xmax, Ymax
-- i zwraca listę par współrzędnych całkowitoliczbowych, które znajdują się
-- wewnątrz prostokąta, którego jednym z rogów jest (0,0),
-- a drugim (Xmax, Ymax)
-- Przykład:
-- ghci> wspolrzedne 1 1
-- [(0,0), (0,1), (1,0), (1,1)] 
-- ghci> wspolrzedne 1 2
-- [(0,0), (0,1), (0,2), (1,0), (1, 1), (1, 2)]
wspolrzedne :: Int -> Int -> [(Int, Int)]
wspolrzedne x y = [(a,b) | a <- [0..x], b <- [0..y]]


-----------------------------------------------------------------------------

-- SEKCJA 2: ROSE TREE

-- Dany jest typ reprezentujący Rose Tree (czyli drzewo, które może mieć
-- dowolną liczbę gałęzi w każdym z węzłów):
data Rose a = a :> [Rose a] deriving Show
-- (moglibyśmy to zapisać jako: data Rose a = Rose a [Rose a],
-- ale zapis z :> będzie czytelniejszy i wygodniejszy)

-- Dane jest również przykładowe drzewo dla jasności:
przyklad = 0 :> [1 :> [2 :> [3 :> [4 :> [], 5 :> []]]], 6 :> [], 7 :> [8 :> [9 :> [10 :> []], 11 :> []], 12 :> [13 :> []]]]

-- [5%] ZADANIE 2.1
-- Zdefiniuj funkcję, która oblicza rozmiar drzewa (ilość węzłów w drzewie)
-- Przykład:
-- ghci> rozmiar przyklad
-- 14

rozmiar :: Rose a -> Int
rozmiar (x :> y) = if length y == 0
                        then 1
                        else 1 + (sum $ map rozmiar y)

--------------------------------------

-- [5%] ZADANIE 2.2
-- Zdefiniuj funkcję, która oblicza liczbę liści w drzewie
-- Przykład:
-- ghci> liscie przyklad
-- 6
liscie :: Rose a -> Int
liscie (x :> y) = if length y == 0
                        then 1
                        else sum $ map rozmiar y

--------------------------------------

-- [15%] ZADANIE 2.3
-- Znasz dobrze funkcję map (a jeżeli nie to się nie przyznawaj!)
-- chcielibyśmy coś podobnego mieć dla drzewa = mieć możliwość wywołania
-- funkcji dla każdego elementu drzewa i otrzymania drzewa z wynikami.
-- Taka funkcjonalność w Haskellu jest realizowana przez type-class Functor,
-- który definiuje funkcję fmap, która przyjmuje funkcję i jakąś strukturę

-- Zwykły map działa dla list, więc w przypadku definiowania Functor dla
-- listy moglibyśmy po prostu wywołać map:
-- instance Functor [] where
--    fmap = map

-- W przypadku naszego drzewa będzie to tylko trochę trudniejsze 🙂
-- Przykłady:
-- ghci> fmap (*2) (1 :> [2 :> [], 3 :> []])
-- (2 :> [4 :> [], 6 :> []]) 
-- ghci> fmap (+1) (1 :> [])
-- (2 :> [])

-- instance Functor Rose where
--     fmap (x :> y) = 

--------------------------------------

-- [15%] ZADANIE 2.4
-- Napisz funkcję, która spłaszcza nasze drzewo do listy. Algorytm przechodzenia
-- po drzewie jest dowolny.
-- Przykład dla przeszukiwania drzewa w głąb (DFS):
-- ghci> splaszcz przyklad
-- [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

merge [] ys = ys
merge (x:xs) ys = x:merge ys xs

splaszcz :: Rose a -> [a]
splaszcz (x :> y) = if length y == 0
                        then [x]
                        else x : (foldl (\acc x -> merge (splaszcz x) acc) [] y)

-----------------------------------------------------------------------------

-- SEKCJA 3: FOLD

-- [20%] ZADANIE 3
-- Napisz funkcję mojaMapa korzystajac z foldr/foldl.
-- Funkcja powinna mieć taką samą funkcjonalność jak wbudowana funkcja map
mojaMapa :: (a -> b) -> [a] -> [b]
mojaMapa f xs = foldr (\x acc -> f x : acc) [] xs

-----------------------------------------------------------------------------

-- SEKCJA 4: TESTY

-- [5*5%] Zdefiniuj testy jednostkowe do wybranych 5 zadań z kolokwium.
-- Dla każdego zadania powinny być dwa testy. Jeden z nich może być przykładem
-- zaczerpniętym z opisu zadania, drugi test wymyśl samodzielnie.
-- Zdefiniuj również funkcję uruchomTesty, która uruchamia zestaw wszystkich
-- przygotowanych przez ciebie testów.

uruchomTesty = undefined