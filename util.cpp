/*
#include <ostream>
#include "util.hpp"

// Prints out token
// Makes it easy to print tokens. Just std::cout << token; will work.
std::ostream &operator<<(std::ostream &out, JCC::Parser::token::token_kind_type value)
{
    switch (value)
    {
    case JCC::Parser::token::T_ADD:
        out << "+";
        break;
    case JCC::Parser::token::T_SUB:
        out << "-";
        break;
    case JCC::Parser::token::T_MULT:
        out << "*";
        break;
    case JCC::Parser::token::T_DIV:
        out << "/";
        break;
    case JCC::Parser::token::T_LPAR:
        out << "(";
        break;
    case JCC::Parser::token::T_RPAR:
        out << ")";
        break;
    case JCC::Parser::token::T_ID:
        out << "ID";
        break;
    case JCC::Parser::token::T_NUM:
        out << "NUM";
        break;
    default:
        out << "";
        break;
    }

    return out;
}
 */