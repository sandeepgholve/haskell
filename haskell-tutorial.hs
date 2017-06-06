-- Haskell Tutorial
{-
    Author: Sandeep Gholve
    Date: 30th May 2017
-}

import Data.List
import System.IO
-- Int min: -2^63, max: 2^63
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Integer is un-bounded whole number
-- "Integer" is an arbitrary precision type: it will hold any number no matter 
-- how big, up to the limit of your machine's memory…. This means you never 
-- have arithmetic overflows. On the other hand it also means your arithmetic is
-- relatively slow. Lisp users may recognise the "bignum" type here.
--
-- "Int" is the more common 32 or 64 bit integer. Implementations vary, 
-- although it is guaranteed to be at least 30 bits.


-- Float - precision point is upto 11
bigFloat = 3.99999999999 + 0.00000000005
anotherBigFloat = 3.999999999999 + 0.000000000005

always5 :: Int 
always5 = 5
-- always5 = 10

-- Maths related stuffs
sumOf1To10 = sum [1..10]
add5and4 = 5 + 4
sub5and4 = 5 - 4
mul5and4 = 5 * 4
div5and4 = 5 / 4

-- Pre-fix operator
modOf5By4 = mod 5 4
-- In-fix operator
modOf5By4_version2 = 5 `mod` 4

-- Adding negative number requires additional parentheses as follows:
negNumEx = 5 + (-2)

-- Square Root function works on floating number so we need coversion as
-- follows:
num9 = 9 :: Int
sqrtOf9 = sqrt (fromIntegral num9)

-- Some more mathematics stuff
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.9999
ceilingVal = ceiling 9.9999
floorVal = floor 9.9999

-- Logical operators
trueAndFalse = True && False
trueOrfalse = True || False
notTrue = not(True)

-- Lists
primeNumbers = [3, 5, 7, 11]
-- Concatination
morePrimes = primeNumbers ++ [13, 17, 19, 23, 29]
favNums = 2 : 7 : 11 : 66 : []
-- pre-pend
morePrimes2 = 2 : morePrimes

maxPrime = maximum morePrimes2
minPrime = minimum morePrimes2

newList = [2, 3, 4]
productOfList = product newList

zeroToTen = [0..10]
evenList = [2, 4..10]
oddList = [1, 3..10]
charAlternateList = ['A', 'C'..'Z']

-- Infinite list (as haskell is Lazy, so it will not get evaluated unless its
-- called so it will not go in infinite loop.
infiPower10 = [10, 20..]
-- usage: take 10 infiPower10

many2s = take 10 (repeat 2)
many3s = replicate 10 3

cycleList = take 10 (cycle [1, 2, 3, 4, 5])

listTimes2 = [x * 2 | x <- [1..10]]
listTimes2Under12 = [x * 2 | x <- [1..10], x * 2 <= 12]

-- Find all numbers until 500 which is divisible by 9 as well as 13
divisibleBy9And13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]

-- Sorted List
sortedList = sort [5, 1, 7, 2, 4]

-- Sum of Lists
sumOfLists = zipWith (+) [1, 2, 3, 4, 5] [6, 7, 8, 9, 10]

listBiggerThan5 = filter (>5) morePrimes2

-- Even numbers upto 20 from infinite list
evensUpTo20 = takeWhile (<= 20) [2,4..]

multOfList = foldl (*) 1 [2, 3, 4, 5]

-- More List operation
pow3List = [3^n | n <- [1..10]]

multTable = [[x * y | y <- [1..10]] | x <- [1..10]]

{-
  - Tuples Section
-}
sandeep = ("Sandeep Gholve", 34)
anita = ("Anita Gholve", 30)

sandeepName = fst sandeep
sandeepAge = snd sandeep

names = ["Sandeep", "Anita"]
addresses = ["Berlin", "Pune"]
nameAndAddresses = zip names addresses

