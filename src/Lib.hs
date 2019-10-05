module Lib
    ( partitions
    ) where

partitions :: Word -> [Word] -> [[Word]]
partitions _ [] = []
partitions n (p:ps) = if n < p then (partitions n ps)
                     else if n == p then [ [n] ] ++ (partitions n ps)
                     else [ p:x | x <- (partitions (n-p) $ p:ps) ] ++ (partitions n ps)
