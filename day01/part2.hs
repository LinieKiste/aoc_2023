import System.IO
import Data.Char ( isDigit )

main = do
    handle <- openFile "input.txt" ReadMode
    contents <- hGetContents handle
    print $ solve contents
    hClose handle

solve xs = sum $ map toNumber (lines $ mapStrToNum xs)
    where
        toNumber = (\xs -> read (head xs:[last xs]) :: Integer) . filter isDigit

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

