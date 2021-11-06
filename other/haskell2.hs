import GHC.Conc.Sync (myThreadId)

addMe :: Int -> Int -> Int
-- functionName param1 param2 = operations (returned value)

addMe x y = x + y

sumMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
-- addTuples (x, y)

whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge _ = "Nothing important"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

prodFuc n = product [1 .. n] -- another way to do factorials

isOdd :: Int -> Bool
isOdd n
  | n `mod` 2 == 0 = False
  | otherwise = True

whatGrade :: Int -> String
whatGrade age
  | (age >= 5) && (age <= 6) = "Kindergarten"
  | (age > 6) && (age <= 10) = "Elem School"
  | (age > 10) && (age <= 16) = "high school"
  | otherwise = "Go to college"

batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
  | avg <= 0.200 = "terrible"
  | avg <= 0.7 = "average"
  | otherwise = "superstar"
  where
    avg = hits / atBats

getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x : []) = "your list starts with " ++ show x
getListItems (x : y : []) = "your list contains " ++ show x ++ show y

------- higher order functions

times5 :: Int -> Int
times5 x = x * 5

listItme4 = map times4 [1, 2, 3, 4, 5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x : xs) = times4 x : multBy4 xs

areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x : xs) (y : ys) = x == y && areStringsEq xs ys

areStringEq _ _ = False

doMult :: (Int -> Int) -> Int
doMult func = func 3

num3Time5 = doMult times5

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y

adds3 = getAddFunc 3

fourPlus3 = adds3 4

threePlusList = map adds3 [1, 2, 3, 4, 5]

---- lambdas

dbl1To10 = map (\x -> x * 2) [1 .. 10]

doubleEvenNumber y =
  if (y `mod` 2 /= 0)
    then y
    else y * 2

getClass :: Int -> String
getClass n = case n of
  5 -> "Go to kindergarten"
  6 -> "got to else"
  _ -> "go away."
