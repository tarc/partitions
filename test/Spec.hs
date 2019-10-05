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
      singlePartition ,
      singlePartition2 ,
      twoPartitions ,
      validatePartitionCount
    ])

noPartitionFromEmptySet :: TestTree
noPartitionFromEmptySet = testCase "Testing empty set"
  (assertEqual "There's no possible partition taking from the empty set"
  [] (partitions 3 []))

mainNumberLessThanSmallestPartition :: TestTree
mainNumberLessThanSmallestPartition = testCase "Testing small value"
  (assertEqual "There's no possible partition for such small number"
  [] (partitions 3 [4]))

singlePartition :: TestTree
singlePartition = testCase "Testing small value"
  (assertEqual "There's no possible partition for such small number"
  [[3]] (partitions 3 [3]))

singlePartition2 :: TestTree
singlePartition2 = testCase "Testing small value"
  (assertEqual "There's no possible partition for such small number"
  [[1,1,1,1]] (partitions 4 [1]))

twoPartitions :: TestTree
twoPartitions = testCase "Testing small value"
  (assertEqual "There's no possible partition for such small number"
  [[3,1],[1,1,1,1]] (partitions 4 [3,1]))

validatePartitionCount :: TestTree
validatePartitionCount = testCase ""
  (assertEqual ""
  [partition n | n <- [0..30]] [1,1,2,3,5,7,11,15,22,30,42,56,77,101,135,176,231,297,385,490,627,792,1002,1255,1575,1958,2436,3010,3718,4565,5604] )
