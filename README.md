# Every Day I'm HASKELL(ing)

## USEFUL GHCI COMMANDS

```:l file_name.hs``` - load a Haskell source file into GHCi

```:r``` - make ghci recompile the program

```:t expression``` - ask ghci what type it has chosen for something, for example:

```
Prelude> :t (+)
(+) :: Num a => a -> a -> a
Prelude> :t truncate
truncate :: (Integral b, RealFrac a) => a -> b
```

```:q``` - quits ghci (CTRL + D)

## WORKING WITH LISTS

### BASIC

```numbers = [1,2,3]``` - define list

```moreNumbers = numbers ++ [4,5,6]``` - concatenate lists

```1:[2,3,4]``` - adding an element at beginning of the list using "cons" operator

```head [1,2,3]``` - select the first item from the list

```tail [1,2,3]``` - select all but the first item from the list

```last [1,2,3]``` - select the last item from the list

```init [1,2,3]``` - select all but the last item from the list

```length [1,2,3]``` - list length

```reverse [1,2,3]``` - reverse list

```null [1,2,3]``` - check if the list is empty

```take 2 [1,2,3]``` - take first two element from list

```drop 2 [1,2,3]``` - take all but first two element from list

```[1,2,3] !! 2``` - take element with index 2 from list (indexes numbered from zero)

```elem 4 [1,2,3]``` - check if 4 belongs to the list

```maximum [1,3,2]``` - take maximum value from the list

```minimum [1,3,2]``` - take minimum value from the list

```sum [1,2,3]``` - take sum of values in the list

```product [1,2,3]``` - take product of values in the list

```[0..10]``` - generate numbers from zero to ten

```[2,4..20]``` - generate list of even numbers from zero to ten

```['A','C'..'Z']``` - generate list of other letter

```take 10 (repeat 2)``` ```replicate 10 3``` - generate list of the same elements

```take 10 (cycle [1,2,3,4,5])``` - generate list created by repeatedly repeating elements in the list

```sort [4,1,3,2]``` -- sorting list

### ADVANCED

```[x * 2 | x <- [1..10]]``` - general list created by multiplying each element in the list by two

```[x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]``` - general list of numbers divisible by 9 and 13

```zipWith (+) [1,2,3,4,5] [6,7,8,9,10]``` - adding together the corresponding elements from two lists

```filter (>5) [1,5,3,8,4,9]``` - filter out all numbers less than or equal to 5

```takeWhile (<= 20) [2,4..]``` - sort of while loop

```foldl (*) 1 [2,3,4,5]``` - perform operations on all elements of the list from left to right

### LIST COMPREHENSION EXAMPLES

```[3^n | n <- [1..10]]``` - list created by raising all elements of the list to the 3rd power

```[[x * y | y <- [1..10]] | x <- [1..10]]``` - creating multiplication table

## WORKING WITH FUNCTIONS

* Function name must start with a lowercase letter
* Function must return a value
