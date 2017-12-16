{-# OPTIONS -Wall #-}

module Main where

import System.Random (randomRIO)
import Text.Read (readMaybe)
import Data.Maybe

main :: IO ()
main = do
  putStrLn "Guess the number!"
  secretNumber <- randomRIO (1, 100 :: Int)
  putStrLn ("The secret number is: " ++ show secretNumber)
  go secretNumber
 where
  go sn = do
    putStrLn "Please input your guess."
    guess <- getLine
    let validNum = readMaybe guess :: Maybe Int
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
