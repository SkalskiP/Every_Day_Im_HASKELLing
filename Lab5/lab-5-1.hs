import System.IO  
 
main = do  
    handle <- openFile "../machine.txt" ReadMode  
    contents <- hGetContents handle  
    putStr contents  
    hClose handle