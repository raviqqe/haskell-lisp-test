module Interpreter (
  interpret
) where

import Control.Applicative

import Parser
import Eval



interpret :: String -> IO ()
interpret filename = process =<< (parse filename <$> readFile filename)
  where
    process (Left error) = putStrLn $ show error
    process (Right expr) = putStrLn $ show expr
