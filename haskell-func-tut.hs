{-
  Haskell functions tutorials

num7 = 7
getTriple x = x * 3

result = getTriple num7
-- Now result of 'getTriple num7' = 21 
-}

import Data.List
import System.IO

{-
 - ghc --make haskell-func-tut
 -}
main = do
  putStrLn "What's your name ?"
  name <- getLine
  putStrLn ("Hello " ++ name)

addMe :: Int -> Int -> Int
-- funcName param1 param2 = operation (returned value)
addMe x y = x + y

addAnyNum x y = x + y

-- Factorial function
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n - 1)


prodFact :: Int -> Int
prodFact n = product [1..n]

isOdd :: Int -> Bool
isOdd n  
  | n `mod` 2 == 0 = False
  | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String
whatGrade age
  | (age < 3) = "Stay at home"
  | (age >=3) && (age < 6) = "Go to Nursery"
  | (age >=6) && (age < 11) = "Go to Elementary School"
  | (age >=11) && (age < 19) = "Go to High School"
  | (age >=19) && (age < 22) = "Go to College"
  | otherwise = "Go to Office"

batAvgRating :: Double -> Double -> String
batAvgRating hits atBat
  | avg < 0.200 = "Terrible batting performance"
  | avg < 0.250 = "Average player"
  | avg < 0.280 = "You are doing preety good"
  | otherwise = "You are Superstar"
  where avg = hits / atBat

getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "First item in list is " ++ show x ++ " and rest are " ++ show xs

-- Get first items from String
getFirstItem :: String -> String
getFirstItem [] = "String is Empty"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ [x]

-- Higher Order Functions
times4 :: Int -> Int
times4 n = n * 4
listTimes4 = map times4 [1, 2, 3, 4, 5]

-- Creating our own map function
multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

-- Strings equal ?
areStringsEqual :: [Char] -> [Char] -> Bool
areStringsEqual [] [] = True
areStringsEqual (x:xs) (y:ys) = x == y && areStringsEqual xs ys
-- for any other case just return False
areStringsEqual _ _ = False

doMult :: (Int -> Int) -> Int
doMult func = func 3
num3Times4 = doMult times4

-- Higher order function which returns a fuction
getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y
adds3 = getAddFunc 3
fourPlus3 = adds3 4
threePlusList = map adds3 [1,2,3,4,5]

-- lambdas (means anonymous functions)
-- its defined with '\' i.e. back-slash
dbl1To10 = map (\x -> x * 2) [1..10]

-- Conditionals operators
-- less than <
-- greather than >
-- less than equal to <=
-- greater than equal to >=
-- not equal to /=
-- And &&
-- Or ||
-- not not


-- Using case statement
getClass :: Int -> String
getClass n = case n of
  5 -> "Go to Kindergarten"
  6 -> "Go to Elementary school"
  _ -> "Go to college"

-- Enumerations in Haskell
data CricketPlayer =  Batsman
                      | Bowler
                      | WicketKeeper
                      | AllRounder
                    deriving Show

sachinTendulkar :: CricketPlayer -> Bool
sachinTendulkar Batsman = True

sachinInCricket = print(sachinTendulkar Batsman)

-- Custom data types
data Customer = Customer String String Double
  deriving Show

tomSmith :: Customer

tomSmith = Customer "Tom Smith" "161 Rhinstr. Berlin 10315" 25.07
getBalance :: Customer -> Double
getBalance  (Customer _ _ b) = b


-- One more example of Rock-Paper-Scissors of custom data type
data RPS = ROCK | PAPER | SCISSORS

shoot :: RPS -> RPS -> String
shoot PAPER ROCK = "Paper beats Rock"
shoot ROCK SCISSORS = "Rock beats Scissors"
shoot SCISSORS PAPER = "Scissors beats Paper"
shoot SCISSORS ROCK = "Scissors loses to Rock"
shoot PAPER SCISSORS = "Paper loses to Scissors"
shoot ROCK PAPER = "Rock loses to Paper"
shoot _ _ = "Error"

-- One more example of custom data types

data Shape = Circle Float Float Float | Rectangle Float Float Float Float
  deriving Show

area :: Shape -> Float

area (Circle _ _ r) = pi * r^2
-- '$' can be used to remove parentheses, so equivalent of following
-- area (Rectangle x1 y1 x2 y2) = (abs (x2-x1)) * (abs(y2-y1))
-- is:
area (Rectangle x1 y1 x2 y2) = ( abs $ x2 - x1 ) * ( abs $ y2 - y1 )

areaOfCircle = area (Circle 20 30 10)
areaOfRectangle = area (Rectangle 10 10 20 20)

