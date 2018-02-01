import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem greedilyincreasing
	
	Difficulty: 2.4
	Solved:     2018-01-23
-}

gis_iter :: [Int] -> [Int] -> [Int]
gis_iter t   [] = reverse t
gis_iter t@(x:xs) (y:ys) = if   y>x then gis_iter (y:t) ys
                           else          gis_iter t     ys

gis :: [Int] -> [Int]
gis [] = []
gis (x:xs) = gis_iter [x] xs

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = (show$length g)++"\n"++(unwords$map show$g)
              where 
                  g = gis.map read.tail.words$text

main :: IO ()
main = interact solve

