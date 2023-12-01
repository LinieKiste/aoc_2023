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

solve xs = sum $ map toNumber (lines xs)
    where
        toNumber = (\xs -> read (head xs:[last xs]) :: Integer) . filter isDigit


