#include <iostream>

#ifndef AST_HPP
#define AST_HPP
#define INDENT_CHAR ' '

enum Operator
{
    ADD,
    SUB,
    DIV,
    MULT,
    LT,
    GT,
    LE,
    GE,
    PS,
    EQ,
    DEQ,
    NEQ,
    EX,
    AND,
    OR
};

enum Type
{
    INT,
    BOOLEAN,
    VOID
};

extern int INDENT;

class AST;
class Prog;

class Statement;
class Block;
class If;
class IfElse;
class Assignment;
class Null;
class Return;
class Break;
class While;

class Expression;
class Id;
class Num;
class ArOp;
class CmOp;
class Actuals;
class FunctionCall;

class Declaration;
class Function;
class Variable;
class Paramater;

template <typename BaseClass, typename T>
inline bool instanceOf(const T *)
{
    return std::is_base_of<BaseClass, T>::value;
}

std::ostream &operator<<(std::ostream &out, const Operator value);
std::ostream &operator<<(std::ostream &out, const Type value);

class AST
{
protected:
    std::vector<AST *> children;

    virtual void addChild(AST *child) = 0;

public:
    AST() = default;

    virtual ~AST()
    {
        for (auto child : children)
        {
            delete child;
        }
        children.clear();
    }

    virtual void print() = 0;
};

class Prog : public AST
{

protected:
    void addChild(AST *child) override
    {
        children.push_back(child);
    }

public:
    const char *const progName;

    Prog(const char *const str) : progName(str){};

    void addNode(AST *node)
    {
        addChild(node);
    }

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Program: " << progName << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

#endif