-- all immutable. functions passed as parameter. does have constants. nor for while. lazy execution. compiler is very script. haskell is a great language

import Data.ByteString.Builder.Extra (doubleHost)
import Data.List
import GHC.Base (maxInt)
import System.IO

-- Int -2^63 2&73
maxInts = maxBound :: Int

minInts = minBound :: Int

-- floats and doubl - bools and char denoted with single quotes '
always5 :: Int
always5 = 5

sumOfNums = sum [1 .. 100]

modEx = mod 5 4

modEx2 = 5 `mod` 4 -- infix opertor becuase its in -betwen these two numbers

negNumEx = 5 + (-4)

num9 = 9 :: Int

s = True && False

primeNumbers = [3, 5, 7, 11] ++ [13, 15, 18]

-- creates a list
favNums = 2 : 7 : 21 : 66 : []

revPrime = reverse favNums

firstPrime = head revPrime

lastPrime = lastPrime

primeInit = init favNums

-- take takes first from array. drop drops the firs in arraly
-- elem checks element is in a list.
--maximum takes max in a list. and minimum does the opposite.
newList = [2, 3, 5]

productOfList = product newList

zeroToTen = [0 .. 10]

evenList = [2, 4 .. 20]

letterList = ['A', 'C' .. 'Z']

many2s = take 10 (repeat 2) -- repeat 2 for ever and take first 10

many3s = replicate 10 3 -- generate 10 r's

cycleList = take 10 (cycle [1, 2, 3, 4, 5]) -- cycle repeats for ver

listTimes2 = [x * 2 | x <- [1 .. 10], x * 3 <= 50]

divisBy9n13 = [x | x <- [1 .. 500], x `mod` 13 == 0, x `mod` 9 == 0]

sortedList = sort [92, 3, 5, 2, 9]

sumOfLists = zipWith (+) [1, 2, 3, 4] [3, 4, 5, 6]

listBiggerThan5 = filter (> 5) sortedList

evensUpTo20 = takeWhile (<= 20) [2, 4 ..]

multlOfList = foldl (*) 1 [1, 2, 3, 4]

multlOfList2 = foldr (*) 1 [1, 2, 3, 4]

----- List comprehensions

pow3List = [3 ^ n | n <- [1 .. 10]]

-- multTable = [[x*y | y <- [1..10]] |]

randomTuple = (1, "Random Tuple")

bobsmith = ("bob Smith", 52)

bobsName = fst bobsmith

bobsAge = snd bobsmith

names = ["Bob", "mar", "Tom"]

addresses = [1, 3, 4]

main = do
  putStrLn "What's your name"
  name <- getLine
  putStrLn ("Hello " ++ name)