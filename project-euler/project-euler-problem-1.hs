{-
 - Solutions for the 'Project Euler' problems.
 -}

{-
 - Problem 1: If we list all the natural numbers below 10 that are multiples of
 - 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 -
 - Find the sum of all the multiples of 3 or 5 below 1000. (i.e. until 999)
 -
 -}

 -- Find numbers until 1000 which are multiples of 3 OR 5
 multiplesOf3Or5 = [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]
 sumOfList = sum multiplesOf3Or5

 -- final answer is sumOfList = 233168
 
