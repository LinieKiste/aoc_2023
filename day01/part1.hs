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
        toDigits xs = map (filter isDigit) (lines xs)


