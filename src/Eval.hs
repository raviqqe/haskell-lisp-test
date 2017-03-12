module Eval (
  eval
) where

import Syntax


eval :: Expr -> IO ()
eval expr = putStrLn $ show expr
