{-
  Haskell functions tutorials

num7 = 7
getTriple x = x * 3

result = getTriple num7
-- Now result of 'getTriple num7' = 21 
-}

import Data.List
import System.IO

main = do
  putStrLn "What's your name ?"
  name <- getLine
  putStrLn ("Hello " ++ name)
