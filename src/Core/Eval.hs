module Core.Eval (
  eval
) where

import Control.Moand.State

import Core.Syntax


-- types

Evaluator a = State (String -> Expr) a


-- functions

eval :: Expr -> [Int]
eval = evalState . evalExpr

evalExpr :: Expr -> Evaluator [Int]
evalExpr (EInt int) = [int]
evalExpr (ESymbol symbol) = do
  lookupEnv <- get
  evalExpr $ lookupEnv symbol
evalExpr (EPair (EFunc env args body) right) =
evalExpr (EPair left right) = (++) <$> evalExpr left <*> evalExpr right
evalExpr (EFunc _ _ _) = do
  fail "Cannot evaluate EFunc"
