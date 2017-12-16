{-# OPTIONS -Wall #-}

module Main where

-- import           Control.Monad.Loops (whileJust_)
import           System.Random       (randomRIO)
import           Text.Read (readMaybe)
-- import Control.Monad

main :: IO ()
main = putStrLn "hh"
-- main = do
--   putStrLn "Guess the number!"
--   secretNumber <- randomRIO (1, 100 :: Int)
--   putStrLn ("The secret number is: " ++ show secretNumber)
--   whileJust_
--     ( do
--       putStrLn "Please input your guess."
--       guess <- getLine
--       return $ if (readMaybe guess :: Maybe Int) /= Just secretNumber then (readMaybe guess :: Maybe Int) else Nothing
--     )
--     ( \guess -> do
--       putStrLn $ "You guessed: " ++ show guess
--       if guess < secretNumber
--         then putStrLn "Too small!"
--         else putStrLn "Too big!"
--     )
--   putStrLn "You win!"


-- if (readMaybe "77" :: Maybe Int) == Just 77 then Just 77 else Nothing
-- if (readMaybe "dd" :: Maybe Int) == Just 77 then Just 77 else Nothing
-- if (readMaybe "dd" :: Maybe Int) /= Just 77 then Just 77 else Nothing

-- main = do
--   line <- getLine
--   unless (line == "q") $ do
--     putStrLn "1"
--     putStrLn line
--     main
getUserLines :: IO String
getUserLines = go ""
 where
  go contents = do
    line <- getLine
    if line == "q" then return contents else go (contents ++ line ++ "\n")

-- testIt :: IO String
-- testIt = do
--   putStrLn "ok"
--   go ""
--     where
--       go contents = do
--         line <- getLine
--         if line == "q" then return contents else go (contents ++ line ++ "\n")

testIt :: IO ()
testIt = do
  putStrLn "Guess the number!"
  secretNumber <- randomRIO (1, 100 :: Int)
  putStrLn ("The secret number is: " ++ show secretNumber)
  go secretNumber
    where
      go sn = do
        putStrLn "Please input your guess."
        guess <- getLine
        if (readMaybe guess :: Maybe Int) /= Just sn then putStrLn "keep going" else putStrLn "got it"
