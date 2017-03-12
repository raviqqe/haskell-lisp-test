module Args (
  Args(..),
  parseArgs,
) where

import Options.Applicative


-- types

data Args = Args { sourceCodeFilename :: Maybe FilePath, debug :: Bool }
            deriving Show


-- functions

args :: Parser Args
args = Args <$> argument (optional str)
                         (metavar "FILE"
                       <> value Nothing)
            <*> switch (short 'd'
                     <> long "debug"
                     <> help "toggle debug mode" )


parseArgs :: IO Args
parseArgs = execParser argsWithHelp
  where
    argsWithHelp = info (helper <*> args)
                        (fullDesc
                      <> progDesc "Interpret source code \
                                  \of Jack programming language"
                      <> header "My Lisp Interpreter" )
