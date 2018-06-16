import Data.List
import System.IO

-- Int -2^63 2^63
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Integer unbounded whole number
-- Float single precision floating point numbers
-- Double floating point numbers with precision up to eleven points

bigFloat = 3.99999999999 + 0.00000000005
bigFloat2 = 3.999999999999 + 0.00000000005

-- Bool True/False
-- Char single unicode characters '
-- Tuple

always5 :: Int
always5 = 5

sumOfNums = sum [1..1000]

addEx = 5 + 4
subEx = 5 - 4
multEx = 5 * 4
divEx = 5 / 4

modEx = mod 5 4
modEx2 = 5 `mod` 4

negNumEx = 5 + (-4)

num9 = 9 :: Int
sqrtOf9 = sqrt(fromIntegral num9)