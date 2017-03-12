module Core (
  Env,
  lookup
) where

import Data.Word

import Core.Env
import Core.Eval



Symbol = String
Expr = ESymbol Symbol
     | EFunc [Symbol] Env Expr
     | EPair Expr Expr

Env = Env { env :: Map.Map Symbol Value, env }


-- functions

initialEnv :: Env
initialEnv = Map.empty

fallbackEnv :: Symbol ->
fallbackEnv

eval :: Expr -> [Int]
eval (EInt int) = int
