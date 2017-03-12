{-# LANGUAGE FlexibleContexts #-}

module Parser.LanguageDef (
  languageDef
) where

import Text.Parsec
import Text.Parsec.Token


identChar :: Stream s m Char => ParsecT s u m Char
identChar = letter <|> char '_'


opChar :: Stream s m Char => ParsecT s u m Char
opChar = error "No operator parser exists in Fawkes"


languageDef :: Stream s m Char => GenLanguageDef s u m
languageDef = LanguageDef {
    commentStart = "",
    commentEnd = "",
    commentLine = ";",
    nestedComments = False,
    identStart = identChar,
    identLetter = identChar,
    opStart = opChar,
    opLetter = opChar,
    reservedNames = [],
    reservedOpNames = [],
    caseSensitive = True
  }
