module Lib
    ( partitions ,
      partition
    ) where

partitions :: Word -> [Word] -> [[Word]]
partitions _ [] = []
partitions n (p:ps) = if n == 0 && p == 0 then [[0]]
                     else if p == 0 then (partitions n ps)
                     else if n < p then (partitions n ps)
                     else if n == p then [ [n] ] ++ (partitions n ps)
                     else [ p:x | x <- (partitions (n-p) $ p:ps) ] ++ (partitions n ps)

partition :: Word -> Word
partition n = fromIntegral $ length $ partitions n [0..n]
