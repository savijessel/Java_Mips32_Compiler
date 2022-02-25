#include <string>
#include <iostream>
#include <vector>
#include "ast.hpp"

int INDENT = 0;
std::string opFormatStr = " { 'Op': '";
std::string attrFormatStr = " { 'Attr': '";
std::string regFormatStr = " { ";
std::string typeFormatStr = " { 'Type': '";

AST::AST(std::string myNodeType, NodeName myName, std::vector<AST *> nodes, int myLineNum)
{
    nodeType = myNodeType;
    addNodes(nodes);
    name = myName;
    lineNum = myLineNum;
}

AST::AST(std::string myNodeType, NodeName myName, int myLineNum)
{
    nodeType = myNodeType;
    name = myName;
    lineNum = myLineNum;
}

Prog::Prog(std::string myNodeType, NodeName myName, int myLineNum)
{
    nodeType = myNodeType;
    name = myName;
    lineNum = myLineNum;
}

Prog::Prog(std::string myNodeType, NodeName myName, std::vector<AST *> nodes, int myLineNum)
{
    nodeType = myNodeType;
    addNodes(nodes);
    name = myName;
    lineNum = myLineNum;
}

/* BinOp::BinOp(AST *left, Operator op, AST *right)
{
    op = op;
    left = left;
    addChild(left);
    right = right;
    addChild(right);
}

UnOp::UnOp(Operator op, AST *ex)
{
    op = op;
    ex = ex;
    addChild(ex);
}

 Statement *Statement::append(Statement *a, Statement *b)
{
    if (!a->hasNext())
    {
        a->setNext(b);
        return a;
    }

    Stmt *last = a;
    while (last->hasNext())
        last = last->getNext();
    last->setNext(b);
    return a;
}

Statement::Statement()
{
    nextStatement = nullptr;
} */

std::ostream &operator<<(std::ostream &out, const Type value)
{

    switch (value)
    {
    case INT:
        return out << "int";
    case BOOLEAN:
        return out << "boolean";
    case VOID:
        return out << "void";
    default:
        return out << "";
    }
}

std::ostream &operator<<(std::ostream &out, const NodeName value)
{

    switch (value)
    {

    case binop:
        return out << "Binary Operation" << opFormatStr;

    case unop:
        return out << "Unary Operation" << opFormatStr;

    case assignment:
        return out << "Assignment" << opFormatStr;

    case num:
        return out << "Number" << typeFormatStr;

    case statementexpression:
        return out << "statement expression" << typeFormatStr;

    case none:
        return out << "empty" << typeFormatStr;

    case program:
        return out << "program" << regFormatStr;

    case literal:
        return out << "literal" << typeFormatStr;

    case type:
        return out << "type" << attrFormatStr;

    case globaldeclarations:
        return out << "global declarations" << typeFormatStr;

    case variabledeclaration:
        return out << "variable declaration" << typeFormatStr;

    case identifier:
        return out << "identifier" << attrFormatStr;

    case functiondeclaration:
        return out << "function declaration" << typeFormatStr;

    case functionheader:
        return out << "function header" << typeFormatStr;

    case functiondeclarator:
        return out << "function declarator" << typeFormatStr;

    case formalparameterlist:
        return out << "formal parameter list" << typeFormatStr;

    case formalparameter:
        return out << "formal parameter" << typeFormatStr;

    case mainfunctiondeclaration:
        return out << "main function declaration" << typeFormatStr;

    case mainfunctiondeclarator:
        return out << "main function declarator" << typeFormatStr;

    case block:
        return out << "block" << typeFormatStr;

    case blockstatements:
        return out << "block statements" << typeFormatStr;

    case statement:
        return out << "statement" << typeFormatStr;

    case ifstm:
        return out << "if" << typeFormatStr;

    case whilestm:
        return out << "while" << typeFormatStr;

    case returnstm:
        return out << "return" << typeFormatStr;

    case breakstm:
        return out << "break" << typeFormatStr;

    case argumentlist:
        return out << "argument list" << typeFormatStr;

    case functioncall:
        return out << "function call" << typeFormatStr;

    default:
        return out << "" << regFormatStr;
        ;
    }
}
