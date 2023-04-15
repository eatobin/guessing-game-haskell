module Main (main) where

import Control.Monad
import Data.Maybe
import qualified System.IO as SIO
import System.Random (randomRIO)
import Text.Read (readMaybe)

main :: IO ()
main = do
  putStrLn "Guess the number!"
  secretNumber <- randomRIO (1, 100 :: Int)
  putStrLn ("Sweetie, the secret number is: " ++ show secretNumber)
  go secretNumber
  where
    go sn = do
      putStrLn "Please input your guess."
      SIO.hFlush SIO.stdout
      guess <- getLine
      let validNum = readMaybe guess :: Maybe Int
      when
        (isJust validNum)
        (putStrLn ("You guessed: " ++ show (fromJust validNum)))
      if isJust validNum
        then case compare (fromJust validNum) sn of
          LT -> do
            putStrLn "Too small!"
            go sn
          GT -> do
            putStrLn "Too big!"
            go sn
          EQ -> putStrLn "You win!"
        else go sn
