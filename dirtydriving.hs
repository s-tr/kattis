import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem dirtydriving

	Difficulty: 2.8
	Solved:     2018-01-25
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = show $ (minimum ds) - (minimum a)
             where
                 [[_,d],ds] = (map (map read.words) $ lines text)
                 a          = zipWith (-) (sort ds) (map(d*)[1..])

main :: IO ()
main = interact solve

