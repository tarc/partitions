module Lib
    ( partition
    ) where

partition :: Word -> [Word] -> [[Word]]
partition _ [] = []
