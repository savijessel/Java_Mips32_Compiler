
#ifndef SYMBOL_HPP
#define SYMBOL_HPP

#include <iostream>
#include <vector>
#include <unordered_map>
#include <map>
#include <tuple>

// Helper function to output error messages
int symbolError(std::string message, int line);

class SymbolTableEntry;
class SymbolTable;

// Class to represent Symbol Table Entry
class SymbolTableEntry
{

public:
    // identifier used to key entry
    std::string symbol;

    // type of identifier
    std::string type;

    // label for code generation
    std::string label;

    // offset for code generation

    int offset;

    // type of params if applicable
    std::vector<std::string> paramTypes;

    // scope of definition
    int scope;

    int lineNum;

    // constructors
    SymbolTableEntry() = default;
    SymbolTableEntry(std::string symbol, std::string type, int scope, int lineNum);
    SymbolTableEntry(std::string symbol, std::string type, std::vector<std::string> paramTypes, int scope, int lineNum);

    // helper function to print entry
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

    // helper function to clear entry
    void clear()
    {
        symbol.clear();
        type.clear();
        paramTypes.clear();
    }

    // helper function to produce a 'signature' string used in AST
    std::string signature()
    {
        if (!paramTypes.empty())
        {
            std::string params = "";
            for (auto pType : paramTypes)
            {
                params += pType + ",";
            }
            params.pop_back();
            return "sig: 'f(" + params + ")', ";
        }
        else
        {
            return "sig: '" + type + "', ";
        }
    }
};

// Class to represent symbol table
class SymbolTable
{
public:
    int scope = 0;
    // Table is a stack (vector) of hash maps
    std::vector<std::unordered_map<std::string, SymbolTableEntry *>> tables;

    SymbolTable() = default;

    // push new hash onto the stack and increment scope
    void openScope()
    {
        std::unordered_map<std::string, SymbolTableEntry *> table;
        tables.push_back(table);
        scope++;
    }

    // define a new entry in the table
    void define(SymbolTableEntry *entry)
    {
        // check if entry is already in current scope
        if (tables.back().find(entry->symbol) != tables.back().end())
        {
            if (entry->type == "main")
            {
                exit(symbolError("Multiple main declarations found", entry->lineNum));
            }
            exit(symbolError("Identifier '" + entry->symbol + "' redefined", entry->lineNum));
        }

        else
        {
            tables.back()[entry->symbol] = entry;
        }
    }

    // lookup entry in all scopes and return pointer to entry
    SymbolTableEntry *lookup(std::string symbol)
    {
        // loop through table entries and attempt to find
        for (auto iter = tables.rbegin(); iter != tables.rend(); ++iter)
        {
            auto search = (*iter).find(symbol);
            if (search != (*iter).end())
            {
                auto searchCopy = search->second;
                return searchCopy;
            }
        }

        // return nullptr if no enteries were found
        return nullptr;
    }

    // lookup entry in global scope and return pointer to entry if in global scope
    SymbolTableEntry *lookupGlobal(std::string symbol)
    {
        // attempt to find entry from global scope
        auto search = tables[1].find(symbol);

        if (search != tables[1].end())
        {
            auto searchCopy = search->second;
            return searchCopy;
        }

        // attempt to find entry from predefined scope

        search = tables[0].find(symbol);

        if (search != tables[0].end())
        {
            auto searchCopy = search->second;
            return searchCopy;
        }

        // return nullptr if no enteries were found
        return nullptr;
    }

    // pop current hash from stack and decrement scope
    void closeScope()
    {
        tables.pop_back();
        scope--;
    }

    // helper function to print out symbol table
    void print()
    {
        for (auto iter = tables.rbegin(); iter != tables.rend(); ++iter)
        {
            for (auto it = (*iter).cbegin(); it != (*iter).cend(); ++it)
            {
                std::cout << "key: " << (it)->first << std::endl;
                std::cout << "  symbol: " << (it)->second->symbol << std::endl;
                std::cout << "  type: " << (it)->second->type << std::endl;
                std::cout << "  paramTypes: " << std::endl;
                for (auto type : (it)->second->paramTypes)
                {
                    std::cout << type << std::endl;
                }
                std::cout << "  scope: " << (it)->second->scope << std::endl;
                std::cout << "  line: " << (it)->second->lineNum << std::endl;
            }
        }
    }
};

#endif