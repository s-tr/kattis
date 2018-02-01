import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem trilemma

	Difficulty: 4.0
	Solved:     2017-11-18
-}

cases :: [String]
cases = map (\x -> "Case #"++(show x)++": ") [1..]

data Point = P Double Double

distance :: Point -> Point -> Double
distance (P x1 y1) (P x2 y2) = sqrt$ (x2-x1)^2 + (y2-y1)^2

(~=) :: Double -> Double -> Bool
(~=) a b | a<=b+1e-12 && a>=b-1e-12 = True
         | 2>1                      = False

cosAngle :: Double -> Double -> Double -> Double
cosAngle a b c = (a*a+b*b-c*c)/(2*a*b)

computeLine :: String -> String
computeLine line = let {
                       [x1,y1,x2,y2,x3,y3] = map read$words line
                   ;   (p1,p2,p3) = (P x1 y1 , P x2 y2 , P x3 y3)
                   ;   [d1,d2,d3] = sort [distance p1 p2 , distance p2 p3 , distance p3 p1]
                   ;   [c1,c2,c3] = reverse$sort [cosAngle d1 d2 d3, cosAngle d2 d3 d1, cosAngle d3 d1 d2]
                   } in if   (any (==0) [d1,d2,d3]) || (any (~= 1) [c1,c2,c3]) then "not a triangle"
				        else let {
							     s1 = if (c1 ~= c2) || (c2 ~= c3) then "isosceles " else "scalene "
							 ;   s2 = if  (c3 ~=0) then "right "
							          else if (c3>0) then "acute " else "obtuse "
						     } in s1 ++ s2 ++ "triangle"


solve :: String -> String
solve = unlines . zipWith (++) cases . map computeLine . tail . lines

main :: IO ()
main = interact solve
