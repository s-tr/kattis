import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem wordsfornumbers
	
	Difficulty: 2.4
	Solved:     2018-01-23
-}

digits :: [String]
digits = ["zero","one","two","three","four","five","six","seven","eight","nine"]
tens = ["","ten","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
teens = ["","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]

capitalise :: String -> String
capitalise []     = []
capitalise (x:xs) = (toUpper x):xs

toNumber :: String -> String
toNumber [a]   = if   not (isDigit a) then [a] 
                 else digits !! ((ord a)-(ord '0'))
toNumber [a,b] = if   (not (isDigit a)) || (not (isDigit b)) then [a,b]
                 else if   (a=='0') then toNumber [b]
                      else if   (b=='0') then tens !! ((ord a)-(ord '0'))
                           else if   (a=='1') then teens !! ((ord b)-(ord '0'))
                                else (tens !! ((ord a)-(ord '0'))) ++ "-" ++
                                     (digits !! ((ord b)-(ord '0')))
toNumber x     = x

computeLine :: String -> String
computeLine = capitalise . unwords . map toNumber . words

solve :: String -> String
solve = unlines . map computeLine . lines

main :: IO ()
main = interact solve

