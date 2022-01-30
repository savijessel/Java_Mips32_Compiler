/********************************
 * Example C++ Lexical Analyzer
 * Written for CPSC 411 Tutorial
 * File: scanner.hpp
 * Shankar Ganesh
 * *****************************/

#ifndef SCANNER_HPP
#define SCANNER_HPP

#include <iostream>
#include <fstream>
#include <memory>

// Token enum
enum
{
    T_ID = 1,
    T_TRUE,
    T_FALSE,
    T_BOOLEAN,
    T_INT,
    T_VOID,
    T_IF,
    T_ELSE,
    T_WHILE,
    T_BREAK,
    T_RETURN,
    T_NUM,
    T_ADD,
    T_SUB,
    T_DIV,
    T_MULT,
    T_LT,
    T_GT,
    T_GE,
    T_LE,
    T_PS,
    T_EQ,
    T_DEQ,
    T_NEQ,
    T_EX,
    T_AND,
    T_OR,
    T_SEM,
    T_COM,
    T_LPAR,
    T_RPAR,
    T_LBRC,
    T_RBRC,
    T_STRING,
};

// Lexer class. Inherits yyFlexLexer
class CCLexer : public yyFlexLexer
{
public:
    // Can also shoose to specify ostream, but not necessary
    CCLexer(std::istream *in) : yyFlexLexer(in) { yylineno = 1; }

    virtual ~CCLexer() = default;

    // Flex will produce this function.
    // BUT YOU MUST HAVE THE PROTOTYPE IN THE CLASS
    int yylex();

    int getLine() { return yylineno; }

    std::string lexeme;
};

// Prototype. Defined in scanner.l
std::unique_ptr<CCLexer> createLexer(std::istream *input);

inline char const *getName(int tok)
{
    switch (tok)
    {

    case T_ID:
        return "ID";

    case T_TRUE:
        return "true";

    case T_FALSE:
        return "false";

    case T_BOOLEAN:
        return "boolean";

    case T_INT:
        return "int";

    case T_VOID:
        return "void";

    case T_IF:
        return "if";

    case T_ELSE:
        return "else";

    case T_WHILE:
        return "while";

    case T_BREAK:
        return "break";

    case T_RETURN:
        return "return";

    case T_NUM:
        return "NUM";

    case T_ADD:
        return "+";

    case T_SUB:
        return "-";

    case T_DIV:
        return "/";

    case T_MULT:
        return "*";

    case T_LT:
        return "<";

    case T_GT:
        return ">";

    case T_LE:
        return "<=";

    case T_GE:
        return ">=";

    case T_PS:
        return "%";

    case T_EQ:
        return "=";

    case T_DEQ:
        return "==";

    case T_NEQ:
        return "!=";

    case T_EX:
        return "!";

    case T_AND:
        return "&&";

    case T_OR:
        return "||";

    case T_SEM:
        return ";";

    case T_COM:
        return ",";

    case T_LPAR:
        return "(";

    case T_RPAR:
        return ")";

    case T_LBRC:
        return "{";

    case T_RBRC:
        return "}";

    case T_STRING:
        return "string";

    default:
        return "";
    }
}

#endif