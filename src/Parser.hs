module Parser (
  parse,
  ParseError,
) where

import Control.Applicative ((<$>))
import Text.Parsec hiding (parse, State)
import Text.Parsec.Indent

import Parser.Expression
import qualified Parser.Parser as P
import Syntax


parse :: String -> String -> Either ParseError Expr
parse sourceName sourceCode
  = P.parse (contents $ moduleExpr) sourceName sourceCode

moduleExpr :: P.Parser Expr
moduleExpr = withPos $ EList <$> many indentedList

contents :: P.Parser a -> P.Parser a
contents parser = do
  spaces
  c <- parser
  eof
  return c
