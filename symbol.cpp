#include <iostream>
#include <vector>
#include <unordered_map>
#include "symbol.hpp"

// constructor for variable identifier
SymbolTableEntry::SymbolTableEntry(std::string mySymbol, std::string myType, int myScope, int myLineNum)
{

    symbol = mySymbol;
    type = myType;
    scope = myScope;
    lineNum = myLineNum;
}

// constructor for function identifier
SymbolTableEntry::SymbolTableEntry(std::string mySymbol, std::string myType, std::vector<std::string> myParamTypes,
                                   int myScope, int myLineNum)
{

    symbol = mySymbol;
    type = myType;
    paramTypes = myParamTypes;
    scope = myScope;
    lineNum = myLineNum;
}

// Output an error message and exit in failure
int symbolError(std::string message, int line)
{
    std::cerr << "Semantic Error: " << message << " on or near line " << line << std::endl;
    return EXIT_FAILURE;
}
