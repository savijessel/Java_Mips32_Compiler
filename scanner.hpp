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

#if !defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include "parser.hh"
#include "location.hh"

// used to count number of warning messages output
static int warningCounter = 0;

namespace JCC
{
    // Lexer class. Inherits yyFlexLexer
    class Lexer : public yyFlexLexer
    {
    public:
        // Can also shoose to specify ostream, but not necessary
        Lexer(std::istream *in) : yyFlexLexer(in){};

        virtual ~Lexer() = default;

        // Flex will produce this function.
        // BUT YOU MUST HAVE THE PROTOTYPE IN THE CLASS
        virtual int yylex(JCC::Parser::semantic_type *yylval, JCC::Parser::location_type *location);
    };
}
// Prototype. Defined in scanner.l
std::unique_ptr<JCC::Lexer> createLexer(std::istream *input);

// Lexer helper function that outputs an error message
// returns EXIT_FAILURE to indicate scanner.l should terminate the program
inline int scanError(std::string message, JCC::Parser::location_type loc)
{
    std::cerr << "Error: " << message << " on or near line " << loc << std::endl;
    return EXIT_FAILURE;
}

// Scanner helper function that outputs a warning message
// Outputs an error message if at least 10 warnings occur
inline bool scanWarning(std::string message, JCC::Parser::location_type loc)
{
    warningCounter++;

    // if number of warnings exceeds 10, output error message and reset warning counter
    // returns true to indicate scanner.l should terminate the program
    if (warningCounter >= 10)
    {
        std::cerr << "Error: Too many warnings on or near line " << loc << ". Quitting program " << std::endl;
        warningCounter = 0;
        return true;
    }
    std::cerr << "Warning: " << message << " on or near line " << loc << std::endl;
    return false;
}

#endif
