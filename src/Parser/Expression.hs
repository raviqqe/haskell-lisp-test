module Parser.Expression (
  indentedList
) where

import Control.Monad.State
import Control.Applicative ((<$>), (<*>))
import Text.Parsec hiding (parse, State)
import Text.Parsec.Indent
import qualified Text.Parsec.Expr as Ex

import Parser.Parser
import qualified Parser.Lexer as L
import Syntax


expr :: Parser Expr
expr = Ex.buildExpressionParser [] $ same >> (try atom <|> list)

indentedList :: Parser Expr
indentedList = EList <$> withBlock (++) (many1 expr) (indentedList)

list :: Parser Expr
list = EList <$> (L.parens $ many expr)

atom :: Parser Expr
atom = EAtom <$> L.atom
