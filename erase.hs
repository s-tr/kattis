import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem erase

	Difficulty: 1.7
	Solved:     2017-12-02
-}

computeLine :: String -> String
computeLine line = undefined

h :: Char -> Char
h '0' = '1'
h '1' = '0'
h _   = undefined

solve :: String -> String
solve text = let { 
                [a,orig,final] = lines text
             ;  n              = read a
             ;  final'         = if (n`mod`2)==0 then orig else map h orig
             } in if final==final' then "Deletion succeeded" else "Deletion failed"

main :: IO ()
main = interact solve

