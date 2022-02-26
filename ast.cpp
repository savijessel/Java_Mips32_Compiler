#include <string>
#include <iostream>
#include <vector>
#include "ast.hpp"

int INDENT = 0;

// strings to help format different AST properties
std::string attrFormatStr = " { Attr: '";
std::string regFormatStr = " { ";
std::string typeFormatStr = " { Type: '";

// AST constructor with all paramaters
AST::AST(std::string myNodeType, NodeName myName, std::vector<AST *> nodes, int myLineNum)
{
    nodeType = myNodeType + "', ";
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
AST::AST(std::string myNodeType, NodeName myName, int myLineNum)
{
    nodeType = myNodeType + "', ";
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
        return out << "Binary Operation" << typeFormatStr;

    case unop:
        return out << "Unary Operation" << typeFormatStr;

    case assignment:
        return out << "Assignment" << typeFormatStr;

    case num:
        return out << "Number" << typeFormatStr;

    case statementexpression:
        return out << "statement expression" << typeFormatStr;

    case nullstm:
        return out << "null statement" << regFormatStr;

    case program:
        return out << "program" << regFormatStr;

    case literal:
        return out << "literal" << typeFormatStr;

    case type:
        return out << "type" << attrFormatStr;

    case globaldeclarations:
        return out << "global declarations" << regFormatStr;

    case variabledeclaration:
        return out << "variable declaration" << regFormatStr;

    case identifier:
        return out << "identifier" << attrFormatStr;

    case functiondeclaration:
        return out << "function declaration" << regFormatStr;

    case functionheader:
        return out << "function header" << typeFormatStr;

    case functiondeclarator:
        return out << "function declarator" << regFormatStr;

    case formalparameterlist:
        return out << "formal parameter list" << regFormatStr;

    case formalparameter:
        return out << "formal parameter" << regFormatStr;

    case mainfunctiondeclaration:
        return out << "main function declaration" << regFormatStr;

    case mainfunctiondeclarator:
        return out << "main function declarator" << regFormatStr;

    case block:
        return out << "block" << regFormatStr;

    case blockstatements:
        return out << "block statements" << regFormatStr;

    case statement:
        return out << "statement" << regFormatStr;

    case ifstm:
        return out << "if" << typeFormatStr;

    case whilestm:
        return out << "while" << regFormatStr;

    case returnstm:
        return out << "return" << regFormatStr;

    case breakstm:
        return out << "break" << regFormatStr;

    case argumentlist:
        return out << "argument list" << regFormatStr;

    case functioncall:
        return out << "function call" << regFormatStr;

    default:
        return out << "" << regFormatStr;
        ;
    }
}
