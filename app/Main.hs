module Main where

import Lib

main :: IO ()
main = print $ partitions 25 $ [4,7]
