import Data.List
import Data.Char
import Data.Function
import Data.Ratio

{-
	Kattis problem fraction

	Difficulty: 3.9
	Solved:     2017-11-24
-}

computeLine :: String -> String
computeLine line = undefined

contToRatio :: [Integer] -> Ratio Integer
contToRatio [a] = a % 1
contToRatio (x:xs) = (x%1) + 1/(contToRatio xs)

ratioToCont :: Ratio Integer -> [Integer]
ratioToCont r = let (intPart, fracPart) = (floor r, r - (fromIntegral$floor r))
                in  if   fracPart == 0 then [intPart]
                    else intPart:(ratioToCont$1/fracPart)

solve :: String -> String
solve text = let {
                 [_,r1,r2]=map((map read).words)$lines text;
                 d1 = contToRatio r1;
                 d2 = contToRatio r2
             } in unlines$map(unwords.map show.ratioToCont)$[d1+d2,d1-d2,d1*d2,d1/d2]
                 

main :: IO ()
main = interact solve

