{-# OPTIONS -Wall #-}

module Main where

import           Control.Monad.Loops (whileJust_)
import           System.Random       (randomRIO)

main :: IO ()
main = do
  putStrLn "Guess the number!"
  secretNumber <- randomRIO (1, 100 :: Int)
  putStrLn("The secret number is: " ++ show secretNumber)
  whileJust_
    (do
      putStrLn "Please input your guess."
      guess <- getLine
      return $ if read guess /= secretNumber
               then Just guess else Nothing)
    (\guess -> do
      putStrLn $ "You guessed: " ++ guess
      if read guess < secretNumber
        then
          putStrLn "Too small!"
        else
          putStrLn "Too big!")
  putStrLn "You win!"
