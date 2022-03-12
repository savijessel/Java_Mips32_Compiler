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
