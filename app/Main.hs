module Main where

import Lib
import Test.HUnit

queens n = placeQueens n
  where
    placeQueens 0 = [[]]    
    placeQueens k = [queen:queens |                     
                     queens <- placeQueens(k-1),
                     queen <- [1..n],
                     safe queen queens]

safe queen queens = all safe (zipWithRows queens)  
  where 
    safe (r,c) = c /= col && not (onDiagonal col row c r)
    row = length queens
    col = queen
    
onDiagonal row column otherRow otherColumn =  
  abs (row - otherRow) == abs (column - otherColumn)
    
zipWithRows queens = zip rowNumbers queens
  where 
    rowCount = length queens
    rowNumbers = [rowCount-1,rowCount-2..0]

main :: IO ()
main = putStrLn ("N-Queens 8 result: " ++ (show (queens 8)))

test1 = TestCase (assertEqual "N-Queens 4" (queens 4) [[3, 1, 4, 2], [2, 4, 1, 3]])
 
test2 = TestCase (assertEqual "N-Queens 5" (queens 5) [[4, 2, 5, 3, 1], [3, 5, 2, 4, 1], [5, 3, 1, 4, 2],
                                                       [4, 1, 3, 5, 2], [5, 2, 4, 1, 3], [1, 4, 2, 5, 3],
                                                       [2, 5, 3, 1, 4], [1, 3, 5, 2, 4], [3, 1, 4, 2, 5],
                                                       [2, 4, 1, 3, 5]])                                                                                                             

test3 = TestCase (assertEqual "N-Queens 6" (queens 6) [[5, 3, 1, 6, 4, 2], [4, 1, 5, 2, 6, 3],                                                        
                                                       [3, 6, 2, 5, 1, 4], [2, 4, 6, 1, 3, 5]])
         
test4 = TestCase (assertEqual "N-Queens 7" (queens 7) [[6, 4, 2, 7, 5, 3, 1], [5, 2, 6, 3, 7, 4, 1], [4, 7, 3, 6, 2, 5, 1],
                                                       [3, 5, 7, 2, 4, 6, 1], [6, 3, 5, 7, 1, 4, 2], [7, 5, 3, 1, 6, 4, 2],
                                                       [6, 3, 7, 4, 1, 5, 2], [6, 4, 7, 1, 3, 5, 2], [6, 3, 1, 4, 7, 5, 2],
                                                       [5, 1, 4, 7, 3, 6, 2], [4, 6, 1, 3, 5, 7, 2], [4, 7, 5, 2, 6, 1, 3],
                                                       [5, 7, 2, 4, 6, 1, 3], [1, 6, 4, 2, 7, 5, 3], [7, 4, 1, 5, 2, 6, 3],
                                                       [5, 1, 6, 4, 2, 7, 3], [6, 2, 5, 1, 4, 7, 3], [5, 7, 2, 6, 3, 1, 4],
                                                       [7, 3, 6, 2, 5, 1, 4], [6, 1, 3, 5, 7, 2, 4], [2, 7, 5, 3, 1, 6, 4],
                                                       [1, 5, 2, 6, 3, 7, 4], [3, 1, 6, 2, 5, 7, 4], [2, 6, 3, 7, 4, 1, 5],
                                                       [3, 7, 2, 4, 6, 1, 5], [1, 4, 7, 3, 6, 2, 5], [7, 2, 4, 6, 1, 3, 5],
                                                       [3, 1, 6, 4, 2, 7, 5], [4, 1, 3, 6, 2, 7, 5], [4, 2, 7, 5, 3, 1, 6],
                                                       [3, 7, 4, 1, 5, 2, 6], [2, 5, 7, 4, 1, 3, 6], [2, 4, 1, 7, 5, 3, 6],
                                                       [2, 5, 1, 4, 7, 3, 6], [1, 3, 5, 7, 2, 4, 6], [2, 5, 3, 1, 7, 4, 6],
                                                       [5, 3, 1, 6, 4, 2, 7], [4, 1, 5, 2, 6, 3, 7], [3, 6, 2, 5, 1, 4, 7],
                                                       [2, 4, 6, 1, 3, 5, 7]])
                                                       
test5 = TestCase (assertEqual "N-Queens 8" (queens 8) [[4, 2, 7, 3, 6, 8, 5, 1], [5, 2, 4, 7, 3, 8, 6, 1], [3, 5, 2, 8, 6, 4, 7, 1],
                                                       [3, 6, 4, 2, 8, 5, 7, 1], [5, 7, 1, 3, 8, 6, 4, 2], [4, 6, 8, 3, 1, 7, 5, 2],
                                                       [3, 6, 8, 1, 4, 7, 5, 2], [5, 3, 8, 4, 7, 1, 6, 2], [5, 7, 4, 1, 3, 8, 6, 2],
                                                       [4, 1, 5, 8, 6, 3, 7, 2], [3, 6, 4, 1, 8, 5, 7, 2], [4, 7, 5, 3, 1, 6, 8, 2],
                                                       [6, 4, 2, 8, 5, 7, 1, 3], [6, 4, 7, 1, 8, 2, 5, 3], [1, 7, 4, 6, 8, 2, 5, 3],
                                                       [6, 8, 2, 4, 1, 7, 5, 3], [6, 2, 7, 1, 4, 8, 5, 3], [4, 7, 1, 8, 5, 2, 6, 3],
                                                       [5, 8, 4, 1, 7, 2, 6, 3], [4, 8, 1, 5, 7, 2, 6, 3], [2, 7, 5, 8, 1, 4, 6, 3],
                                                       [1, 7, 5, 8, 2, 4, 6, 3], [2, 5, 7, 4, 1, 8, 6, 3], [4, 2, 7, 5, 1, 8, 6, 3],
                                                       [5, 7, 1, 4, 2, 8, 6, 3], [6, 4, 1, 5, 8, 2, 7, 3], [5, 1, 4, 6, 8, 2, 7, 3],
                                                       [5, 2, 6, 1, 7, 4, 8, 3], [6, 3, 7, 2, 8, 5, 1, 4], [2, 7, 3, 6, 8, 5, 1, 4],
                                                       [7, 3, 1, 6, 8, 5, 2, 4], [5, 1, 8, 6, 3, 7, 2, 4], [1, 5, 8, 6, 3, 7, 2, 4],
                                                       [3, 6, 8, 1, 5, 7, 2, 4], [6, 3, 1, 7, 5, 8, 2, 4], [7, 5, 3, 1, 6, 8, 2, 4],
                                                       [7, 3, 8, 2, 5, 1, 6, 4], [5, 3, 1, 7, 2, 8, 6, 4], [2, 5, 7, 1, 3, 8, 6, 4],
                                                       [3, 6, 2, 5, 8, 1, 7, 4], [6, 1, 5, 2, 8, 3, 7, 4], [8, 3, 1, 6, 2, 5, 7, 4],
                                                       [2, 8, 6, 1, 3, 5, 7, 4], [5, 7, 2, 6, 3, 1, 8, 4], [3, 6, 2, 7, 5, 1, 8, 4],
                                                       [6, 2, 7, 1, 3, 5, 8, 4], [3, 7, 2, 8, 6, 4, 1, 5], [6, 3, 7, 2, 4, 8, 1, 5],
                                                       [4, 2, 7, 3, 6, 8, 1, 5], [7, 1, 3, 8, 6, 4, 2, 5], [1, 6, 8, 3, 7, 4, 2, 5],
                                                       [3, 8, 4, 7, 1, 6, 2, 5], [6, 3, 7, 4, 1, 8, 2, 5], [7, 4, 2, 8, 6, 1, 3, 5],
                                                       [4, 6, 8, 2, 7, 1, 3, 5], [2, 6, 1, 7, 4, 8, 3, 5], [2, 4, 6, 8, 3, 1, 7, 5],
                                                       [3, 6, 8, 2, 4, 1, 7, 5], [6, 3, 1, 8, 4, 2, 7, 5], [8, 4, 1, 3, 6, 2, 7, 5],
                                                       [4, 8, 1, 3, 6, 2, 7, 5], [2, 6, 8, 3, 1, 4, 7, 5], [7, 2, 6, 3, 1, 4, 8, 5],
                                                       [3, 6, 2, 7, 1, 4, 8, 5], [4, 7, 3, 8, 2, 5, 1, 6], [4, 8, 5, 3, 1, 7, 2, 6],
                                                       [3, 5, 8, 4, 1, 7, 2, 6], [4, 2, 8, 5, 7, 1, 3, 6], [5, 7, 2, 4, 8, 1, 3, 6],
                                                       [7, 4, 2, 5, 8, 1, 3, 6], [8, 2, 4, 1, 7, 5, 3, 6], [7, 2, 4, 1, 8, 5, 3, 6],
                                                       [5, 1, 8, 4, 2, 7, 3, 6], [4, 1, 5, 8, 2, 7, 3, 6], [5, 2, 8, 1, 4, 7, 3, 6],
                                                       [3, 7, 2, 8, 5, 1, 4, 6], [3, 1, 7, 5, 8, 2, 4, 6], [8, 2, 5, 3, 1, 7, 4, 6],
                                                       [3, 5, 2, 8, 1, 7, 4, 6], [3, 5, 7, 1, 4, 2, 8, 6], [5, 2, 4, 6, 8, 3, 1, 7],
                                                       [6, 3, 5, 8, 1, 4, 2, 7], [5, 8, 4, 1, 3, 6, 2, 7], [4, 2, 5, 8, 6, 1, 3, 7],
                                                       [4, 6, 1, 5, 2, 8, 3, 7], [6, 3, 1, 8, 5, 2, 4, 7], [5, 3, 1, 6, 8, 2, 4, 7],
                                                       [4, 2, 8, 6, 1, 3, 5, 7], [6, 3, 5, 7, 1, 4, 2, 8], [6, 4, 7, 1, 3, 5, 2, 8],
                                                       [4, 7, 5, 2, 6, 1, 3, 8], [5, 7, 2, 6, 3, 1, 4, 8]])     
                                                                                                    
tests = TestList [TestLabel "test1" test1, 
                  TestLabel "test2" test2, 
                  TestLabel "test3" test3,                                                       
                  TestLabel "test3" test4,                                                       
                  TestLabel "test4" test5]                                                       