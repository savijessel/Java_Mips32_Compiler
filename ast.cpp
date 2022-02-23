#include <string>
#include <iostream>
#include <vector>
#include "ast.hpp"

int INDENT = 0;

ArOp::ArOp(Expression *leftEx, Operator op, Expression *rightEx)
{
    op = op;
    leftEx = leftEx;
    addChild(leftEx);
    rightEx = rightEx;
    addChild(rightEx);
}

CmOp::CmOp(Expression *leftEx, Operator op, Expression *rightEx)
{
    op = op;
    leftEx = leftEx;
    addChild(leftEx);
    rightEx = rightEx;
    addChild(rightEx);
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
}

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

std::ostream &operator<<(std::ostream &out, const Operator value)
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

    case EX:
        return out << "!";

    case AND:
        return out << "&&";

    case OR:
        return out << "||";

    default:
        return out << "";
    }
}
