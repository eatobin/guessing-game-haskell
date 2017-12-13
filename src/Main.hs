{-# OPTIONS -Wall #-}

module Main where

import           Control.Monad.Loops (whileM_)
import           System.Random       (randomRIO)

-- main :: IO ()
-- main = do
--   putStrLn "Guess the number!"
--   secretNumber <- randomRIO (1, 100 :: Int)
--   putStrLn("The secret number is: " ++ show secretNumber)
--   putStrLn "Please input your guess."
--   guess <- getLine
--   putStrLn ("You guessed: " ++ guess)
--   case compare (read guess) secretNumber of
--     LT ->  putStrLn "Too small!"
--     GT -> putStrLn "Too big!"
--     EQ -> putStrLn "You win!"



main :: IO ()
main = do
  putStrLn "Guess the number!"
  secretNumber <- randomRIO (1, 100 :: Int)
  putStrLn("The secret number is: " ++ show secretNumber)
  putStrLn "Please input your guess."
  whileM_
    (do
      guess <- getLine
      return (guess /= show secretNumber))
    (do
      putStrLn ("You guessed: " ++ guess)
      putStrLn ("One more time... You guessed: " ++ guess))
  putStrLn "Bye"



-- | No explicit recursion
logIn2 :: IO ()
logIn2 = do
  putStrLn "% Enter password:"
  whileM_
    (do
      guess <- getLine
      return (guess /= "secret"))
    (do
      putStrLn "% Wrong password!"
      putStrLn "% Try again:")
  putStrLn "$ Congratulations!"

-- | With $ syntax.
logIn3 :: IO ()
logIn3 = do
  putStrLn "% Enter password:"
  whileM_
    (do
      guess <- getLine
      return (guess /= "secret")) $
    do
    putStrLn "% Wrong password!"
    putStrLn "% Try again:"
  putStrLn "$ Congratulations!"

-- | With operator sectioning and <$>.
logIn5 :: IO ()
logIn5 = do
  putStrLn "% Enter password:"
  whileM_ ((/= "secret") <$> getLine) $ do
    putStrLn "% Wrong password!"
    putStrLn "% Try again:"
  putStrLn "$ Congratulations!"

guess :: IO ()
guess = do
  putStrLn "Please input your guess."
  whileM_
    (do
      guess <- getLine
      return (guess /= "secret"))
    (do
      putStrLn ("You guessed: " ++ guess)
      putStrLn ("And " ++ guess ++ " is wrong."))
  putStrLn "Right - Bye..."
