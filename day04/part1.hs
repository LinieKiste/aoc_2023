import System.IO
import Data.Char
import Control.Monad
import Control.Arrow ((***))

main = do
    handle <- openFile "input.txt" ReadMode
    contents <- hGetContents handle
    print $ solve contents
    hClose handle

solve xs = sum $ map (computePoints.separate) (lines xs)

computePoints :: ([Int], [Int]) -> Int
computePoints (winning, drawn) = foldr nextPoint 0 (filter (`elem` winning) drawn)
nextPoint _ 0 = 1
nextPoint _ x = x*2

separate line = let numbers = drop 2 $ dropWhile (/= ':') line in
    join (***) readNums $ splitOn '|' numbers

splitOn c s = let (a, b) = break (==c) s in (init a, drop 2 b)

readNums :: String -> [Int]
readNums "" = []
readNums s = read (takeWhile isDigit $ dropWhile isSpace s): readNums (dropWhile isSpace $ dropWhile isDigit $ dropWhile isSpace s)

