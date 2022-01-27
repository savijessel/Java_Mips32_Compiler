all: flex scanner

flex: scanner.l
	flex --c++ scanner.l

scanner: scanner.hpp lex.yy.cc scanner.cpp
	g++ -std=c++14 -o scanner lex.yy.cc scanner.cpp

clean:
	rm -rf *.yy.cc scanner
