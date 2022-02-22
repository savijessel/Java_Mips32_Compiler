# Simple and readable. Not for portability.

CXX := clang++
CXXFLAGS := -std=c++14
OBJS = parser.o scanner.o main.o
EXEC = parser


all: build

-include $(OBJ:.o=.d) 

%.cc %.hh: %.yy
	bison -o $*.cc $<

%.cc: %.l
	flex --c++ -o $*.cc $<

%.o: %.cc
	$(CXX) $(CXXFLAGS) -c $< -MMD -MF $*.d

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -MMD -MF $*.d

build: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(EXEC) $^

clean:
	rm -f *.o *.d *.hh $(EXEC) *.cc 

