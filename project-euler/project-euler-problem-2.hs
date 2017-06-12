{-
 - Solutions for the 'Project Euler' problems.
 -}

{-
 - Problem 2: Each new term in the Fibonacci sequence is generated by adding the
 - previous two terms. By starting with 1 and 2, the first 10 terms will be:
 -
 - 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 -
 - By considering the terms in the Fibonacci sequence whose values do not exceed
 - four million, find the sum of the even-valued terms.
 -
 - 4 million means 4000000
 -}

-- fibs :: [Integer]
-- fibs = 0 : 1 : zipWith (+) fibs (tail, fibs)
-- fibs a b = a : fibs b (a+b)
-- fib 0 = 0
-- fib 1 = 1
-- fib n = fib(n-1) + fib(n-2)

-- Solution #1
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
fibList n = map fib [1..n]
-- final answer is sumOfList = 233168
 
