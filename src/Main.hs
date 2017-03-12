module Main where

import Args
import REPL
import Interpreter



main :: IO ()
main = do
  args <- parseArgs
  case sourceCodeFilename args of
    Nothing -> runREPL
    Just filename -> interpret filename
