/********************************
 * This file contains code with slight references to tutorial code shown by the TA
 * Source - ast. hpp
 * TA - Shankar Ganesh
 * *****************************/

#include <iostream>
#include <regex>
#include <vector>
#include "symbol.hpp"

#ifndef AST_HPP
#define AST_HPP
#define INDENT_CHAR ' '

// enum to represent different names/references for nodes
enum NodeName
{
    binop,
    unop,
    assignment,
    num,
    nullstm,
    program,
    literal,
    type,
    globaldeclarations,
    variabledeclaration,
    identifier,
    functiondeclaration,
    functionheader,
    functiondeclarator,
    formalparameterlist,
    formalparameter,
    mainfunctiondeclaration,
    mainfunctiondeclarator,
    block,
    blockstatements,
    statement,
    ifstm,
    whilestm,
    returnstm,
    breakstm,
    statementexpression,
    argumentlist,
    functioncall,
};

extern int INDENT;

class AST;
class Prog;

// header for output helper function
std::ostream &operator<<(std::ostream &out, const NodeName value);

// base AST Class
class AST
{
public:
    // children nodes
    std::vector<AST *> children;

    // add a child to the AST
    void addChild(AST *child)
    {
        children.push_back(child);
    }

    // Name or reference of Node
    NodeName name;

    // Strings to characterize type of node - typically extraneous properties or attributes
    std::string nodeType;
    std::string attribute;

    // properties to store CodegGenInfo
    std::string label;
    std::string altLabel;
    std::string reg;
    int strLen = 0;
    bool prune = false;
    int offsetCount;

    // line number corresponding to node
    int lineNum;

    // symbol table entry reference
    SymbolTableEntry *symbolRef = new SymbolTableEntry();

    // various constructors
    AST() = default;
    AST(std::string nodeType, std::string attribute, NodeName name, std::vector<AST *> nodes, int lineNum);
    AST(std::string nodeType, NodeName name, std::vector<AST *> nodes, int lineNum);
    AST(NodeName name, std::vector<AST *> nodes, int lineNum);
    AST(std::string nodeType, std::string attribute, NodeName name, int lineNum);
    AST(std::string nodeType, NodeName name, int lineNum);
    AST(NodeName myName, int myLineNum);

    // destructor
    virtual ~AST()
    {
        for (auto child : children)
        {
            delete child;
        }
        children.clear();
    }
    // adds several children
    void addNodes(std::vector<AST *> nodes)
    {
        for (auto node : nodes)
        {
            addChild(node);
        }
    }

    // template print function
    virtual void print()
    {

        std::cout << std::string(INDENT * 4, INDENT_CHAR);

        // ensure null character is shown in output
        std::string tempType = nodeType;
        tempType = std::regex_replace(tempType, std::regex("\\0"), "\\x00");

        // build output AST output
        std::string properties = " { ";
        if (tempType != "" && name != unop && name != binop && name != assignment && name != functioncall)
            properties += "Type: '" + tempType + "', ";
        if (attribute != "")
        {
            if (name == unop || name == binop || name == assignment)
            {
                properties += "Type: '" + attribute + "', ";
                properties += "Sig: '" + nodeType + "', ";
            }

            else
            {
                if (attribute == "sig")
                {
                    properties += "Sig: '" + nodeType + "', ";
                }
                else
                {
                    properties += "Attr: '" + attribute + "', ";
                }
            }
        }

        // add signature from symbol table to AST output
        if (symbolRef != nullptr && name == identifier && nodeType != "main")
        {
            properties += symbolRef->signature();
            std::ostringstream address;
            address << (void const *)symbolRef;
            std::string ad = address.str();
            properties += "SymTab Address: '" + ad + +"', ";
        }

        std::cout
            << name << properties << "line: " << lineNum << " }"
            << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

// AST subclass exclusively for the program/start node
class Prog : public AST
{

public:
    Prog(std::string nodeType, NodeName name, int lineNum);
    Prog(std::string nodeType, NodeName name, std::vector<AST *> nodes, int lineNum);

    void print() override
    {

        std::cout << std::string(INDENT * 4, INDENT_CHAR);
        std::cout << "Program: { '" << nodeType << "' } \n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

#endif