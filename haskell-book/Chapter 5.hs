import System.IO
import Text.Printf (printf)

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

-- this is equivalent to above because of currying. This is called Point free style
sum'' = foldl (+) 0

-- in fact foo a = bar b a can always be rewritten as foo = bar b because of currying

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
-- using left fold instead
map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldl (\acc x -> acc ++ [f x]) [] xs
-- however ++ is much slower than : so normally use right folds

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

reverse' :: [a] -> [a] 
reverse' = foldl (\acc x -> x : acc) []
reverse'' :: [a] -> [a] 
reverse'' = foldl (flip (:)) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldl (\acc x -> if f x then x : acc else acc) []

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- How many elements does it take for the sum of the square roots of all natural numbers to exceed 1000? 
sqrtSums :: Int
sqrtSums = length (takeWhile (< 1000) (scanl1 (+) (map sqrt [1..]))) + 1

--   function application operator. THE MIGHT $! it's an infix operator like + so used in the middle
-- f $ x = f x 
-- f a b c is left associate meaning ((f a ) b) c) apply it as you read it. 
-- dollar is right associate so f $ a $ b $ c f is f ( a (b (c))). it's used to write less parenthesis
-- sum (map sqrt [1..130]) can be written as sum $ map sqrt [1..130]
-- its like writing an open parenthesis and closing parenthesis on the far right side
dollar1 = sum (filter (>10) (map (*2) [2..10]))
dollar2 = sum $ filter (>10) $ map (*2) [2..10]

-- it also allow us to treat function application just like any other function
dollar3 = map ($3) [(4+), (10*), (^2), sqrt]


-- function composition is (f . g )(x) = f(g(x))
fc1 = map (\x -> negate (abs x)) [-1, 12, -14]
fc2 = map (negate . abs) [-1, 12, -14]
-- function composition is also right associate
-- so negate (sum (tail xs)) = negate . sum . tail
-- sum (replicate 5 (max 23 123)) == sum . replicate 5 $ max 23 123

-- Point free style
sum''' :: (Num a) => [a] -> a
sum''' xs = foldl (+) 0 xs

-- this is equivalent to above because of currying. This is called Point free style
sum2 x = foldl (+) 0 x

fn x = ceiling (negate (tan (cos (max 50 x))))
fn' = ceiling . negate . tan . cos . max 50

oddSquareSum :: Integer 
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
oddSquareSum2 = sum . takeWhile (<10000) $ filter odd $ map (^2) [1..]
oddSquareSum3 = sum . takeWhile (<10000) . filter odd $ map (^2) [1..]

main :: IO ()
main = do
  print "start"

  print (sum' [1234, 12334])
  print (sum'' [1234, 12334])
  print (map' (+3) [1,2,3])
  print (elem' 2 [1,4,5,9])
  print (maximum' [1,4,5,9])
  print (reverse' [1,4,5,9])
  print (filter' (/=4) [1,4,5,2])
  print sqrtSums
  print dollar1 
  print dollar2
  print dollar3
  print fc1
  print fc2
  -- all equivalent
  print $ replicate 2 (product (map (*3) (zipWith max [1,2] [4,5])))
  print $ replicate 2 $ product $ map (*3) $ zipWith max [1,2] [4,5]
  print $ replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]
  print $ fn' 10
  print oddSquareSum
  print oddSquareSum2
  print oddSquareSum3