import Data.List
import Data.Char
import Data.Function
import Data.Maybe

{-
	Kattis problem helpme

	Difficulty: 2.2
	Solved:     2018-01-18
-}

data Colour = White | Black

data Type   = King | Queen | Rook | Bishop | Knight | Pawn deriving (Eq,Ord)

data Piece = P Colour Type Int Int

instance Show Type where
    show King   = "K"
    show Queen  = "Q"
    show Rook   = "R"
    show Bishop = "B"
    show Knight = "N"
    show Pawn   = ""

instance Show Piece where
    show (P White t x y) = (show t) ++ ((chr$96+x):[]) ++ (show y)
    show (P Black t x y) = (show t) ++ ((chr$96+x):[]) ++ (show (-y))

instance Ord Piece where
    compare (P c1 t1 x1 y1) (P c2 t2 x2 y2) = (t1`compare`t2) `thenCmp` (y1`compare`y2) `thenCmp` (x1`compare`x2)

instance Eq Piece where
    p1 == p2 = (p1`compare`p2)==EQ

thenCmp :: Ordering -> Ordering -> Ordering
LT `thenCmp` _ = LT
GT `thenCmp` _ = GT
EQ `thenCmp` x = x

seconds :: [a] -> [a]
seconds (_:a:xs) = a:(seconds xs)
seconds _        = []

fourths :: [a] -> [a]
fourths (_:_:a:_:xs) = a:(fourths xs)
fourths _            = []

squares :: [[(Int,Int)]]
squares = map (\x -> map (\y -> (y,x)) [1..8])$reverse [1..8]

computeLine :: String -> String
computeLine line = undefined

toPiece :: ((Int,Int),Char) -> Maybe Piece
toPiece (_,':') = Nothing
toPiece (_,'.') = Nothing
toPiece ((x,y),'k') = Just$P Black King x (-y)
toPiece ((x,y),'q') = Just$P Black Queen x (-y)
toPiece ((x,y),'r') = Just$P Black Rook x (-y)
toPiece ((x,y),'b') = Just$P Black Bishop x (-y)
toPiece ((x,y),'n') = Just$P Black Knight x (-y)
toPiece ((x,y),'p') = Just$P Black Pawn x (-y)
toPiece ((x,y),'K') = Just$P White King x y
toPiece ((x,y),'Q') = Just$P White Queen x y
toPiece ((x,y),'R') = Just$P White Rook x y
toPiece ((x,y),'B') = Just$P White Bishop x y
toPiece ((x,y),'N') = Just$P White Knight x y
toPiece ((x,y),'P') = Just$P White Pawn x y

separateIter :: [Piece] -> ([Piece],[Piece]) -> ([Piece],[Piece])
separateIter [] t = t
separateIter ((p@(P White _ _ _)):ps) (a,b) = separateIter ps (p:a,b)
separateIter ((p@(P Black _ _ _)):ps) (a,b) = separateIter ps (a,p:b)

separate :: [Piece] -> ([Piece],[Piece])
separate xs = separateIter xs ([],[])

solve :: String -> String
solve text = "White: "++whiteStr++"\nBlack: "++blackStr
             where 
                 board = map fourths . seconds . lines $ text
                 pieces = catMaybes . map toPiece . concat . zipWith zip squares $ board
                 (whites,blacks) = separate pieces
                 whiteStr = tail . init . show $ sort whites
                 blackStr = tail . init . show $ sort blacks
                 

main :: IO ()
main = interact solve

