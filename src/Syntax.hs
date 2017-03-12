module Syntax where


data Expr = EAtom String
          | EList [Expr]
          deriving Show
