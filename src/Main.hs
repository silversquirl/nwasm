module Main where

import           Data.Bifunctor     (first)
import qualified Data.ByteString    as BS
import qualified Language.Wasm      as Wasm
import           System.Environment (getArgs)
import           System.Exit        (die)

main :: IO ()
main = do
  bytes <-
    getArgs >>= \case
      []     -> BS.getContents
      [path] -> BS.readFile path
      _      -> die "Too many arguments"
  mod <-
    case parseWasm bytes of
      Right x    -> pure x
      Left error -> die error
  print mod
  where
    parseWasm code = Wasm.decode code >>= (first show . Wasm.validate)
