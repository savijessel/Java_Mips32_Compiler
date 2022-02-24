#include <string>
#include <iostream>
#include <vector>
#include "ast.hpp"

int INDENT = 0;

AST::AST(std::string myName, std::vector<AST *> nodes)
{
    name = myName;
    addNodes(nodes);
}

AST::AST(std::string myName)
{
    name = myName;
}

Prog::Prog(std::string myName)
{
    name = myName;
}

Prog::Prog(std::string myName, std::vector<AST *> nodes)
{
    name = myName;
    addNodes(nodes);
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

std::ostream &operator<<(std::ostream &out, const NodeType value)
{

    switch (value)
    {

    case ADD:
        return out << "+";

    case SUB:
        return out << "-";

    case DIV:
        return out << "/";

    case MULT:
        return out << "*";

    case LT:
        return out << "<";

    case GT:
        return out << ">";

    case LE:
        return out << "<=";

    case GE:
        return out << ">=";

    case PS:
        return out << "%";

    case EQ:
        return out << "=";

    case DEQ:
        return out << "==";

    case NEQ:
        return out << "!=";

    case NOT:
        return out << "!";

    case AND:
        return out << "&&";

    case OR:
        return out << "||";

    case statementexpression:
        return out << "statement expression";

    default:
        return out << "";
    }
}
