import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem snapperhard

	Difficulty: 2.5
	Solved:     2018-01-25
-}

computeLine :: String -> String
computeLine line = undefined

bin' :: Int -> [Int]
bin' 0 = [0]
bin' 1 = [1]
bin' n = (n `mod` 2):(bin (n `div` 2))

bin :: Int -> [Int]
bin x = (bin' x) ++ (repeat 0)

compute :: (Int, String) -> String
compute (x,line) = "Case #"++(show x)++": "++if all (==1)$take n$bin k then "ON" else "OFF" 
                       where [n,k]=map read$words line

solve :: String -> String
solve = unlines . map compute . tail . zip [0..] . lines

main :: IO ()
main = interact solve

