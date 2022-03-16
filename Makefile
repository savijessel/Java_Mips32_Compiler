CC := clang++
CXXFLAGS := -std=c++14 -Wall
objs := parser.o scanner.o driver.o ast.o symbol.o semantic.o main.o util.o

all: semantic

%.cc %.hh: %.yy
	bison -o $*.cc $<

%.cc: %.l
	flex --c++ -o $@ $<


-include $(OBJ:.o=.d)

%.o: %.cc
	$(CC) $(CXXFLAGS) -c $< -MMD -MF $*.d

%.o: %.cpp
	$(CC) $(CXXFLAGS) -c $< -MMD -MF $*.d
	
tools: parser.yy scanner.l
	bison -o parser.cc parser.yy
	flex --c++ -o scanner.cc scanner.l

semantic: $(objs)
	$(CC) $(CXXFLAGS) -o $@ $^


clean:
	rm -f *.o *.hh *.cc parser *.d

