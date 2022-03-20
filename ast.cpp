#include <string>
#include <iostream>
#include <vector>
#include "ast.hpp"

int INDENT = 0;

// AST constructor with all paramaters
AST::AST(std::string myNodeType, std::string myAttribute, NodeName myName, std::vector<AST *> nodes, int myLineNum)
{
    nodeType = myNodeType;
    attribute = myAttribute;
    addNodes(nodes);
    name = myName;
    lineNum = myLineNum;
}

AST::AST(std::string myNodeType, NodeName myName, std::vector<AST *> nodes, int myLineNum)
{
    nodeType = myNodeType;
    attribute = "";
    addNodes(nodes);
    name = myName;
    lineNum = myLineNum;
}
// AST constructor with no attributes or properties
AST::AST(NodeName myName, std::vector<AST *> nodes, int myLineNum)
{
    nodeType = "";
    addNodes(nodes);
    name = myName;
    lineNum = myLineNum;
}

// AST constructor with no children parameters
AST::AST(std::string myNodeType, std::string myAttribute, NodeName myName, int myLineNum)
{
    nodeType = myNodeType;
    attribute = myAttribute;
    name = myName;
    lineNum = myLineNum;
}

AST::AST(std::string myNodeType, NodeName myName, int myLineNum)
{
    nodeType = myNodeType;
    attribute = "";
    name = myName;
    lineNum = myLineNum;
}

// AST constructor with no children parameters or attributes/properties
AST::AST(NodeName myName, int myLineNum)
{
    nodeType = "";
    name = myName;
    lineNum = myLineNum;
}

// Partial Prog constructor -- included for extensiblity
Prog::Prog(std::string myNodeType, NodeName myName, int myLineNum)
{
    nodeType = myNodeType;
    name = myName;
    lineNum = myLineNum;
}

// Full Prog constructor -- included for extensiblity
Prog::Prog(std::string myNodeType, NodeName myName, std::vector<AST *> nodes, int myLineNum)
{
    nodeType = myNodeType;
    addNodes(nodes);
    name = myName;
    lineNum = myLineNum;
}

// Helper function to output NodeName objects
std::ostream &operator<<(std::ostream &out, const NodeName value)
{

    switch (value)
    {

    case binop:
        return out << "Binary Operation";

    case unop:
        return out << "Unary Operation";

    case assignment:
        return out << "Assignment";

    case num:
        return out << "Number";

    case statementexpression:
        return out << "statement expression";

    case nullstm:
        return out << "null statement";

    case program:
        return out << "program";

    case literal:
        return out << "literal";

    case type:
        return out << "type";

    case globaldeclarations:
        return out << "global declarations";

    case variabledeclaration:
        return out << "variable declaration";

    case identifier:
        return out << "identifier";

    case functiondeclaration:
        return out << "function declaration";

    case functionheader:
        return out << "function header";

    case functiondeclarator:
        return out << "function declarator";

    case formalparameterlist:
        return out << "formal parameter list";

    case formalparameter:
        return out << "formal parameter";

    case mainfunctiondeclaration:
        return out << "main function declaration";

    case mainfunctiondeclarator:
        return out << "main function declarator";

    case block:
        return out << "block";

    case blockstatements:
        return out << "block statements";

    case statement:
        return out << "statement";

    case ifstm:
        return out << "if";

    case whilestm:
        return out << "while";

    case returnstm:
        return out << "return";

    case breakstm:
        return out << "break";

    case argumentlist:
        return out << "argument list";

    case functioncall:
        return out << "function call";

    default:
        return out << "";
        ;
    }
}
