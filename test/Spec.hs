module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Lib

main :: IO ()
main = do
  defaultMain (testGroup "Our Library Tests"
    [
      noPartitionFromEmptySet ,
      mainNumberLessThanSmallestPartition ,
      singlePartition
    ])

noPartitionFromEmptySet :: TestTree
noPartitionFromEmptySet = testCase "Testing empty set"
  (assertEqual "There's no possible partition taking from the empty set"
  [] (partition 3 []))

mainNumberLessThanSmallestPartition :: TestTree
mainNumberLessThanSmallestPartition = testCase "Testing small value"
  (assertEqual "There's no possible partition for such small number"
  [] (partition 3 [4]))

singlePartition :: TestTree
singlePartition = testCase "Testing small value"
  (assertEqual "There's no possible partition for such small number"
  [[3]] (partition 3 [3]))
