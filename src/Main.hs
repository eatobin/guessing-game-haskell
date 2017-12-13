{-# OPTIONS -Wall #-}

module Main where

import System.Random
-- import Control.Monad

promptLine :: String -> IO String
promptLine prompt = do
  putStr prompt
  getLine

main :: IO ()
main = do
  putStrLn "Guess the number!"
  secretNumber <- randomRIO (1, 100 :: Int)
  putStrLn("The secret number is: " ++ show secretNumber)
  guess <- promptLine "Please input your guess.\n"
  putStrLn ("You guessed: " ++ guess)
  case compare (read guess) secretNumber of
    LT ->  putStrLn "Too small!"
    GT -> putStrLn "Too big!"
    EQ -> putStrLn "You win!"



-- main = do
--   guess <- promptLine "Please input your guess.\n"
--   unless (guess == "q") $ do
--     putStrLn "1"
--     putStrLn "2"
--     main
