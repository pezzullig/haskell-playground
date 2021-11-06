
-- module SampFunctions (getClass, doubleEvenNUmbers) where ..

data BaseballPlayer = Pitcher | Catcher | Infielder | Outfiled deriving (Show)

barryBonds :: BaseballPlayer -> Bool
barryBonds Outfiled = True

barryInOf = print

---

data Customer = Customer String String double
  deriving (Show)

tom :: Customer
tom = customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper beats Rock"

-- keep going

data Shape = Circle Float Float Float | Rectangle Float Flaot Float Float
  deriving (Show)

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x y x2 y2) = (abs $ x2 - x) * (abs $ y2 - y)

sumValue = putStrLn (show 1 + 2)

-- sumValue2 = putStrLn . $ show 1 + 2

-- typeClasses num eq show sets of types iwth certain operations defined for them.

data Employee = Employee
  { name :: String,
    position :: String,
    idNum :: Int
  }
  deriving (Eq, Show)

samSmith = Employee {name = "Sam smith", position = "manager", idNum = 2}

samSmith2 = Employee {name = "Sam smith 2", position = "manager", idNum = 3}

data ShirtSize = S | M | L

instnace Eq ShirtSize where 
    S == S = True 
    M == M = True 
    L == L = True 
    _ == _ = False 

instance Show ShirtSize where
    show S = "Small"
    show M = "Medium" 
    show L = "Large"

smallAvail = S `elem`


class MyEq a where 
    areEqual :: a -> a -> Bool 
instance MyEq  ShirtSize where 
    areEqual S S = True 
    -- ...


