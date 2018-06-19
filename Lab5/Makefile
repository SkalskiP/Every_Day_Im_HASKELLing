all: lab-5 lab-5-1 clean

lab-5: lab-5.hs
	ghc -o ./bin/lab-5 lab-5.hs

lab-5-1: lab-5-1.hs
	ghc -o ./bin/lab-5-1 lab-5-1.hs

.PHONY: clean

clean:
	rm -f *.hi
	rm -f *.o
