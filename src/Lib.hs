module Lib
    ( partition
    ) where

partition :: Word -> [Word] -> [[Word]]
partition _ [] = []
partition n (p:ps) = if n < p then (partition n ps)
                     else [ p:x | x <- (partition (n-p) ps) ] ++ (partition n ps)
