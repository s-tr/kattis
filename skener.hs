import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem skener

	Difficulty: 1.4
	Solved:     2018-01-07
-}

computeLine :: String -> String
computeLine line = undefined

enlarge :: Int -> Int -> String -> [String]
enlarge zr zc = take zr . repeat . concatMap (take zc . repeat)

solve :: String -> String
solve text = unlines enlarged
             where
                 (l1:ls) = lines text
                 [_,_,zr,zc] = map read$words l1
                 enlarged = concatMap (enlarge zr zc) ls

main :: IO ()
main = interact solve

