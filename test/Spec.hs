module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Lib

main :: IO ()
main = do
  defaultMain (testGroup "Our Library Tests"
    [
      noPartitionFromEmptySet ,
      mainNumberLessThanSmallestPartition_3_4 ,
      mainNumberLessThanSmallestPartition_0_4 ,
      noPartitionForPositiveNumberInTermsOfZero ,
      singlePartition_0_0 ,
      singlePartition ,
      singlePartition2 ,
      twoPartitions ,
      validatePartitionCount
    ])

noPartitionFromEmptySet :: TestTree
noPartitionFromEmptySet = testCase "Testing empty set"
  (assertEqual "There's no possible partition taking summands from the empty set."
  [] (partitions 3 []))

mainNumberLessThanSmallestPartition_3_4 :: TestTree
mainNumberLessThanSmallestPartition_3_4 = testCase "Testing value smaller than summand"
  (assertEqual "There's no possible partition for 3 in parcels of 4."
  [] (partitions 3 [4]))

mainNumberLessThanSmallestPartition_0_4 :: TestTree
mainNumberLessThanSmallestPartition_0_4 = testCase "Testing value smaller than summand"
  (assertEqual "There's no possible partition for 0 in parcels of 4."
  [] (partitions 0 [4]))

noPartitionForPositiveNumberInTermsOfZero :: TestTree
noPartitionForPositiveNumberInTermsOfZero = testCase "Testing 0 summand"
  (assertEqual "There's no possible partition for 4 in parcels of 0."
  [] (partitions 4 [0]))

singlePartition_0_0 :: TestTree
singlePartition_0_0 = testCase "Zero has single partition in terms of 0"
  (assertEqual "There's a single partition for 0."
  [[0]] (partitions 0 [0]))

singlePartition :: TestTree
singlePartition = testCase "Value is partition of itself"
  (assertEqual "Single partition of 3 as parcels of 3."
  [[3]] (partitions 3 [3]))

singlePartition2 :: TestTree
singlePartition2 = testCase "Single partition as parcels of 1"
  (assertEqual "Single partition of 4 in parcels of 1."
  [[1,1,1,1]] (partitions 4 [1]))

twoPartitions :: TestTree
twoPartitions = testCase "Two partitions"
  (assertEqual "Two possible partitions of 4 in terms of 3 and 1 summands."
  [[3,1],[1,1,1,1]] (partitions 4 [3,1]))

validatePartitionCount :: TestTree
validatePartitionCount = testCase "Validating the partition counting function"
  (assertEqual "The cardinality of the partitions set must be the same as the partition couting function."
  [partition n | n <- [0..30]] [1,1,2,3,5,7,11,15,22,30,42,56,77,101,135,176,231,297,385,490,627,792,1002,1255,1575,1958,2436,3010,3718,4565,5604] )
