import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem natrij

	Difficulty: 2.6
	Solved:     no
-}

split :: (Eq a) => a -> [a] -> [[a]]
split _ [] = []
split x xs = (r):(split x rs)
                 where
                     (r,rs') = span (/= x) xs
                     rs      = if null rs' then [] else tail rs'

stringToTime :: String -> Int
stringToTime x = let [h,m,s] = map read$split ':' x
                 in  3600*h+60*m+s

timeToString :: Int -> String
timeToString t = (show2 h) ++":"++ (show2 m) ++":"++ (show2 s)
                 where
                     h  = t `div` 3600
                     t' = t - h*3600
                     m  = t' `div` 60
                     s  = t' - m*60

show2 :: Int -> String
show2 x | x==0 = "00"
        | x<10 = '0':(show x)
        | 2>1  = show x

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = let [t1,t2] = map stringToTime $ lines text
             in  if t1==t2 then "24:00:00" else timeToString $ ((86400+t2-t1) `mod` 86400)

main :: IO ()
main = interact solve

