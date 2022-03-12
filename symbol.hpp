#include <iostream>
#include <vector>
#include <unordered_map>

#ifndef SYMBOL_HPP
#define SYMBOL_HPP

class SymbolTableEntry;
class SymbolTable;

class SymbolTableEntry
{

public:
    std::string symbol;
    std::string type;
    std::vector<std::string> paramTypes;
    int scope;
    int lineNum;

    SymbolTableEntry() = default;
    SymbolTableEntry(std::string symbol, std::string type, int scope, int lineNum);
    SymbolTableEntry(std::string symbol, std::string type, std::vector<std::string> paramTypes, int scope, int lineNum);

    void test(int test);
};

class SymbolTable
{
public:
    int scope = 0;
    std::vector<std::unordered_map<std::string, SymbolTableEntry>> tables;

    SymbolTable() = default;

    void openScope()
    {
        std::unordered_map<std::string, SymbolTableEntry> table;
        tables.push_back(table);
        scope++;
    }

    void define(SymbolTableEntry entry)
    {
        // check if entry is already in top table
        if (tables.back().find(entry.symbol) != tables.back().end())
        {
            std::cerr << "Error: Multiply declared identifier on line" << entry.lineNum << std::endl;
            // *** IMPORTANT **** FIX ERROR HANDLING LATER
        }

        else
        {
            tables.back()[entry.symbol] = entry;
            std::cout << "success in defining entry!";
        }
    }

    SymbolTableEntry *lookup(std::string symbol)
    {
        for (auto iter = tables.rbegin(); iter != tables.rend(); ++iter)
        {
            auto search = (*iter).find(symbol);
            if (search != (*iter).end())
            {
                return &search->second;
            }
        }

        std::cerr << "Error: Undeclared identifier on line" << std::endl;
        exit(EXIT_FAILURE);
        // *** IMPORTANT **** FIX ERROR HANDLING LATER
    }

    void closeScope()
    {
        tables.pop_back();
        scope--;
    }
};

#endif