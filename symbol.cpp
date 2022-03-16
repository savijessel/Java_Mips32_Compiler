#include <iostream>
#include <vector>
#include <unordered_map>
#include "symbol.hpp"

SymbolTableEntry::SymbolTableEntry(std::string mySymbol, std::string myType, int myScope, int myLineNum)
{

    symbol = mySymbol;
    type = myType;
    scope = myScope;
    lineNum = myLineNum;
}

SymbolTableEntry::SymbolTableEntry(std::string mySymbol, std::string myType, std::vector<std::string> myParamTypes,
                                   int myScope, int myLineNum)
{

    symbol = mySymbol;
    type = myType;
    paramTypes = myParamTypes;
    scope = myScope;
    lineNum = myLineNum;
}

int symbolError(std::string message, int line)
{
    std::cerr << "Semantic Error: " << message << " on or near line " << line << std::endl;
    return EXIT_FAILURE;
}
