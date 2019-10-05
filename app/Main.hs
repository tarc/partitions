{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Environment   
import Options.Generic

import Lib

data Parameters = Parameters Int [Int]
    deriving (Generic, Show)

instance ParseRecord Parameters

main :: IO ()

main = do
    x <- getRecord "Program to Find all Possible Partitions"
    print
      (let Parameters value summands = (x :: Parameters)
      in partitions (fromIntegral value) (map fromIntegral summands))
