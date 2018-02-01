import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem raggedright

	Difficulty: 1.7
	Solved:     2017-12-02
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = let {
                 lengths   = map length$lines text
             ;   maxlength = maximum lengths
             ;   score     = sum . map ((^2) . (maxlength-)) . tail . reverse $ lengths
             } in show score

main :: IO ()
main = interact solve

