import System.IO
import Data.Char ( isDigit )
import Control.Arrow
import Control.Monad
import Numeric

main = do
    handle <- openFile "input.txt" ReadMode
    contents <- hGetContents handle
    print $ solve contents
    hClose handle

solve contents = sum intTuples
    where
        intTuples = firstAndLast digits
        firstAndLast = map (\xs -> read (head xs:[last xs]) :: Integer)
        digits = toDigits contents :: [String]
        toDigits xs = map (filter isDigit) (lines $ mapStrToNum xs)

mapStrToNum :: String -> String
mapStrToNum all@('o':'n':'e':xs) = '1':mapStrToNum (tail all)
mapStrToNum all@('t':'w':'o':xs) = '2':mapStrToNum (tail all)
mapStrToNum all@('t':'h':'r':'e':'e':xs) = '3':mapStrToNum (tail all)
mapStrToNum all@('f':'o':'u':'r':xs) = '4':mapStrToNum (tail all)
mapStrToNum all@('f':'i':'v':'e':xs) = '5':mapStrToNum (tail all)
mapStrToNum all@('s':'i':'x':xs) = '6':mapStrToNum (tail all)
mapStrToNum all@('s':'e':'v':'e':'n':xs) = '7':mapStrToNum (tail all)
mapStrToNum all@('e':'i':'g':'h':'t':xs) = '8':mapStrToNum (tail all)
mapStrToNum all@('n':'i':'n':'e':xs) = '9':mapStrToNum (tail all)
mapStrToNum (x:xs) = x:mapStrToNum xs
mapStrToNum [] = []

