/********************************
 * This file contains code adapted from tutorial code provided by the TA
 * TA - Shankar Ganesh
 * Reference File - scanner.hpp
 * *****************************/

#ifndef SCANNER_HPP
#define SCANNER_HPP

#include <iostream>
#include <fstream>
#include <memory>

// used to count number of warning messages output
static int warningCounter = 0;

// Token enum
enum
{
    T_ID = 2,
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

// return Token string associated with Token integer
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

// Lexer helper function that outputs an error message
// returns EXIT_FAILURE to indicate scanner.l should terminate the program
inline int scanError(std::string message, int yylineno)
{
    std::cerr << "Error: " << message << " on or near line " << yylineno << std::endl;
    return EXIT_FAILURE;
}

// Scanner helper function that outputs a warning message
// Outputs an error message if at least 10 warnings occur
inline bool scanWarning(std::string message, int yylineno)
{
    warningCounter++;

    // if number of warnings exceeds 10, output error message and reset warning counter
    // returns true to indicate scanner.l should terminate the program
    if (warningCounter >= 10)
    {
        std::cerr << "Error: Too many warnings on or near line " << yylineno << ". Qutting program " << std::endl;
        warningCounter = 0;
        return true;
    }
    std::cerr << "Warning: " << message << " on or near line " << yylineno << std::endl;
    return false;
}

#endif
