module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Lib

main :: IO ()
main = do
  defaultMain (testGroup "Our Library Tests" [mainNumberLessThanSmallestPartition])

mainNumberLessThanSmallestPartition :: TestTree
mainNumberLessThanSmallestPartition = testCase "Testing "
  (assertEqual "There's no possible partition for such small number" [] (partition 3))
