import Data.List
import System.IO

randTuple = (1, "Random Tuple")

bobSmith = ("Bob Smith", 52)
bobsName = fst bobSmith
bobsAge = snd bobSmith

names = ["Bob", "Mary", "Tom"]
addresses = ["123 Main", "234 North", "567 South"]
namesNAddress = zip names addresses