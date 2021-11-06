import Data.Char
import Data.List
import System.IO

-- import Data.List (nub, sort)
-- import Data.list hiding (nub)
-- import qualified Data.Map as M

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

-- wordNumsSort = sortBy (\a b -> snd a > snd b) $ map (\ws -> (head ws, length ws)) . group . sort . words

isIn :: (Eq a) => [a] -> [a] -> Bool
-- isIn' :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

needle `isIn'` haystack = any (needle `isPrefixOf`) $ tails haystack

-- Ceaser Cipher

encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

encode' offset msg = map (chr . (+ offset) . ord) msg

decode' shift msg = encode (negate shift) msg

-- using foldl can lead to stack overflow
-- foldl (+) 0 (replicate 1000000 1)
-- this is because foldl defers evaluation of the function for each item in the array. hence it builds a big list of deffered computations that take up memory.
-- thats why foldl' exists as it doesnt defer computation. instead it evaluates computation at every iteration of foldl

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

main :: IO ()
main = do
  print "start"
  print $ numUniques [1, 2, 1, 4, 3]
  print $ wordNums "bob cat bob zombie bob cat"
  print $ tail [1, 2, 3]
  print ("art" `isIn` "party")
  print $ [3, 4] `isIn'` [1, 3, 4, 5, 6]
  print $ map ord "abcdefg"
  print $ encode 1 "hello my name is Giulio"
  print $ decode' 1 $ encode' 1 "hello my name is Giulio"
  print $ digitSum 2012

-- print $ wordNumsSort "bob cat bob zombie bob cat"
