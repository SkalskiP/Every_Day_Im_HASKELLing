import Test.HUnit
 
 
fact 1 = 1
fact n = n * fact (n - 1)
 
testlist = TestList ["fact 1" ~: fact 1 ~?= 1
    , "fact 2" ~: fact 2 ~?= 2
    , "fact 3" ~: fact 3 ~?= 6
    , "fact 4" ~: fact 4 ~?= 24
    , "fact 5" ~: fact 5 ~?= 120
                    ]
 
main :: IO ()
main = do
  runTestTT testlist
  return ()