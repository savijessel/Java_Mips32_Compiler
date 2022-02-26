/********************************
 * This file contains code with slight references to tutorial code shown by the TA
 * Source - ast. hpp
 * TA - Shankar Ganesh
 * *****************************/

#include <iostream>
#include <regex>
#include <vector>

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
protected:
    // children nodes
    std::vector<AST *> children;

    // add a child to the AST
    void addChild(AST *child)
    {
        children.push_back(child);
    }

public:
    // Name or reference of Node
    NodeName name;

    // String to characterize type of node - typically extraneous properties or attributes
    std::string nodeType;

    // line number corresponding to node
    int lineNum;

    // various constructors
    AST() = default;
    AST(std::string nodeType, NodeName name, std::vector<AST *> nodes, int lineNum);
    AST(NodeName name, std::vector<AST *> nodes, int lineNum);
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

        std::cout << name << tempType << "line: " << lineNum << " }"
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