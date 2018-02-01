import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem toilet

	Difficulty: 2.3
	Solved:     2018-01-31
-}

--always up
type1 :: (Char, Int) -> Char -> (Char, Int)
type1 ('U',x) 'U' = ('U',x)
type1 ('U',x) 'D' = ('U',x+2)
type1 ('D',x) 'U' = ('U',x+1)
type1 ('D',x) 'D' = ('U',x+1)
type1 a       _   = a

--always down
type2 :: (Char, Int) -> Char -> (Char, Int)
type2 ('U',x) 'U' = ('D',x+1)
type2 ('U',x) 'D' = ('D',x+1)
type2 ('D',x) 'U' = ('D',x+2)
type2 ('D',x) 'D' = ('D',x)
type2 a       _   = a

--always as you like it
type3 :: (Char, Int) -> Char -> (Char, Int)
type3 ('U',x) 'U' = ('U',x)
type3 ('U',x) 'D' = ('D',x+1)
type3 ('D',x) 'U' = ('U',x+1)
type3 ('D',x) 'D' = ('D',x)
type3 a       _   = a

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve (x:xs) = (show a)++"\n"++(show b)++"\n"++(show c)
                   where
                       a = snd $ foldl type1 (x,0) xs
                       b = snd $ foldl type2 (x,0) xs
                       c = snd $ foldl type3 (x,0) xs

main :: IO ()
main = interact solve

