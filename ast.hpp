#include <iostream>
#include <vector>

#ifndef AST_HPP
#define AST_HPP
#define INDENT_CHAR ' '

enum NodeType
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
    NOT,
    AND,
    OR,
    none,
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
    ifstatement,
    whilestatement,
    returnstatement,
    breakstatement,
    statementexpression,
    argumentlist,
    functioninvocation,
    unaryexpression,
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

template <typename BaseClass, typename T>
inline bool instanceOf(const T *)
{
    return std::is_base_of<BaseClass, T>::value;
}

std::ostream &operator<<(std::ostream &out, const NodeType value);
std::ostream &operator<<(std::ostream &out, const Type value);

class AST
{
protected:
    std::vector<AST *> children;

    void addChild(AST *child)
    {
        children.push_back(child);
    }

public:
    std::string name;
    AST() = default;
    AST(std::string myName, std::vector<AST *> nodes);
    AST(std::string myName);

    virtual ~AST()
    {
        for (auto child : children)
        {
            delete child;
        }
        children.clear();
    }

    void addNodes(std::vector<AST *> nodes)
    {
        for (auto node : nodes)
        {
            addChild(node);
        }
    }

    virtual void print()
    {

        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--" << name << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class Prog : public AST
{

public:
    Prog(std::string myName);
    Prog(std::string myName, std::vector<AST *> nodes);

    void print() override
    {

        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Program: " << name << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

/* class Statement : public AST
{
};

class Return : public Statement
{

    AST *exp;
    AST *stm;

public:
    If(AST *exp, AST *stm);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "If: "
                  << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class If : public Statement
{

    AST *exp;
    AST *stm;

public:
    If(AST *exp, AST *stm);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "If: "
                  << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class IfElse : public Statement
{

    AST *exp;
    AST *stm;
    AST *stm2;

public:
    IfElse(AST *exp, AST *stm, AST *stm2);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "IfElse: "
                  << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class While : public Statement
{

    AST *exp;
    AST *stm;

public:
    While(AST *exp, AST *stm);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "While: "
                  << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class Declaration : public AST
{
};

class Expression : public AST
{
};

class statementExp : public Expression
{

    AST *assgn;

public:
    statementExp(AST *assg);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Statement Expression:"
                  << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class BinOp : public Expression
{

    Operator op;
    AST *left;
    AST *right;

public:
    BinOp(AST *left, Operator op, AST *right);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Binary Operator: " << op << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class ArgumentList : public Expression
{

    AST *exp;

public:
    ArgumentList(AST *exp);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Argument List: "
                  << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class FunctionCall : public Expression
{

    AST *id;
    AST *argList;

public:
    FunctionCall(AST *id, AST *argList);
    FunctionCall(AST *id);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Function Call: "
                  << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class Id : public Expression
{
    const char *const idName;

    Id(const char *const str) : idName(str){};

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Identifier Expression: " << idName << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class Num : public Expression
{
    const int numName;

    Num(const int num) : numName(num){};

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Number Expression: " << numName << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
};

class UnOp : public Expression
{
    Operator op;
    AST *ex;

    UnOp(Operator op, AST *ex);

    void print() override
    {
        std::cout << std::string(INDENT * 2, INDENT_CHAR);
        std::cout << "--Unary Operator: " << op << "\n";
        INDENT++;
        for (auto child : children)
        {
            child->print();
        }
        INDENT--;
    }
}; */

#endif