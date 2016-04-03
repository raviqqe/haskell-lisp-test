module Main where

import Args
--import REPL
--import Interpreter



main :: IO ()
main = do
  args <- parseArgs
  putStrLn "Interpret source code"
  --case sourceCodeFilename args
  --  None -> runREPL
  --  interpret filename
