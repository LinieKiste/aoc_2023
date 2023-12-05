import System.IO
import Data.Char
import Control.Monad
import Control.Arrow ((***))

main = do
    handle <- openFile "input.txt" ReadMode
    contents <- hGetContents handle
    print $ solve contents
    hClose handle

solve xs = let wins = map (countWins.separate) (lines xs) in
    sum $ processList wins cardsOwned
    where
        cardsOwned = replicate (length (lines xs)) 1

processList :: [Int] -> [Int] -> [Int]
processList (w:ins) (c:ards) = c : processList ins (copyCards c w ards)
processList [] cards = cards

copyCards times 0 xs = xs
copyCards times i (x:xs) = (x+times) : copyCards times (i-1) xs
copyCards times i [] = []

countWins (winning, drawn) = length (filter (`elem` winning) drawn)

separate line = let numbers = drop 2 $ dropWhile (/= ':') line in
    join (***) readNums $ splitOn '|' numbers

splitOn c s = let (a, b) = break (==c) s in (init a, drop 2 b)

readNums :: String -> [Int]
readNums "" = []
readNums s = read (takeWhile isDigit $ dropWhile isSpace s): readNums (dropWhile isSpace $ dropWhile isDigit $ dropWhile isSpace s)

