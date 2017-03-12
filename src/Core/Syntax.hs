module Core.Syntax (
  Expr,
  ESymbol,
  EFunc,
  EPair

  Env,
  lookup
) where

import Data.Map



-- syntax

Expr = EInt Int
     | ESymbol String
     | EFunc Env [String] Expr
     | EPair Expr Expr



-- environment

Env = Map.Map String Expr


lookup :: String -> Env -> Expr
lookup symbol env = case Map.lookup symbol env of
  Just expr -> expr
  Nothing -> lookupBuiltInEnv symbol
  where
    lookupBuiltInEnv = EInt . readMaybe
