{-# LANGUAGE FlexibleContexts #-}

module Parser.Lexer (
  atom,
  parens,
)where

import Text.Parsec hiding (parse, State)
import qualified Text.Parsec.Token as Tok

import Parser.Parser
import Parser.LanguageDef



lexer :: Stream s m Char => Tok.GenTokenParser s u m
lexer = Tok.makeTokenParser languageDef

parens :: Parser a -> Parser a
parens = Tok.parens lexer

atom :: Parser String
atom = Tok.identifier lexer
