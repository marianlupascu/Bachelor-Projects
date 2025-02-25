module Lab2 where
-- Informatics 1 - Functional Programming
-- Lab week tutorial part II
--
--

import           Data.Char
import           PicturesSVG
import           Test.QuickCheck


-- Exercise 1
-- write the correct type and the definition for
isFENChar :: Char -> Bool
isFENChar c = toLower c `elem` "rnbqkp/" || isDigit c

-- Exercise 2.a
-- write a recursive definition for
besideList :: [Picture] -> Picture
besideList = foldl beside Empty

-- Exercise 2.c
-- write the correct type and the definition for
toClear :: Int -> Picture
toClear n = besideList (replicate n clear)

-- Exercise 3
-- write the correct type and the definition for
fenCharToPicture :: Char -> Picture
fenCharToPicture c =
  if isUpper c
    then invert (fenCharToPicture (toLower c))
    else case c of
      'r' -> rook
      'k' -> knight
      'b' -> bishop
      'q' -> queen
      'k' -> king

-- Exercise 4
-- write the correct type and the definition for
-- isFenRow

-- Exercise 6.a
-- write a recursive definition for
fenCharsToPictures :: String -> [Picture]
fenCharsToPictures = undefined

-- Exercise 6.b
-- write the correct type and the definition of
-- fenRowToPicture

-- Exercise 7
-- write the correct type and the definition of
-- mySplitOn

-- Exercise 8.a
-- write a recursive definition for
fenRowsToPictures :: String -> [Picture]
fenRowsToPictures = undefined

-- Exercise 8.b
-- write the correct type and the definition of
-- aboveList

-- Exercise 8.c
-- write the correct type and the definition of
-- fenToPicture

-- Exercise 9
-- write the correct type and the definition of
-- chessBoard

-- Exercise 10
-- write the correct type and definition of
-- allowedMoved
