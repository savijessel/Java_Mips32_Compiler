#include <iostream>
#include <vector>
#include <unordered_map>

#ifndef SYMBOL_HPP
#define SYMBOL_HPP

int symbolError(std::string message, int line);

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

    void print()
    {
        std::cout << "symbol: " << symbol << std::endl;
        std::cout << "  type: " << type << std::endl;
        std::cout << "  paramTypes: " << std::endl;
        for (auto type : paramTypes)
        {
            std::cout << type << std::endl;
        }
        std::cout << "  scope: " << scope << std::endl;
        std::cout << "  lineNum: " << lineNum << std::endl;
    }

    void clear()
    {
        symbol.clear();
        type.clear();
        paramTypes.clear();
    }
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
            exit(symbolError("Multiple declared identifier", entry.lineNum));
        }

        else
        {
            tables.back()[entry.symbol] = entry;
            std::cout << "success in defining entry!" << std::endl;
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

        return nullptr;
    }

    void closeScope()
    {
        tables.pop_back();
        scope--;
    }

    void print()
    {
        for (auto iter = tables.rbegin(); iter != tables.rend(); ++iter)
        {
            for (auto it = (*iter).cbegin(); it != (*iter).cend(); ++it)
            {
                std::cout << "key: " << (*it).first << std::endl;
                std::cout << "  symbol: " << (*it).second.symbol << std::endl;
                std::cout << "  type: " << (*it).second.type << std::endl;
                std::cout << "  paramTypes: " << std::endl;
                for (auto type : (*it).second.paramTypes)
                {
                    std::cout << type << std::endl;
                }
                std::cout << "  scope: " << (*it).second.scope << std::endl;
                std::cout << "  line: " << (*it).second.lineNum << std::endl;
            }
        }
    }
};

#endif