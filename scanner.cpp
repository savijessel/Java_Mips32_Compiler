/********************************
 * Example C++ Lexical Analyzer
 * Written for CPSC 411 Tutorial
 * File: scanner.cpp
 * Shankar Ganesh
 * *****************************/

#include <FlexLexer.h>
#include "scanner.hpp"
#include <cstdlib>
#include <cerrno>
#include <cstring>

int main(int argc, char **argv)
{
    std::istream *input = &std::cin;

    std::ifstream file;

    if (argc == 2)
    {
        file.open(argv[1]);
        ;

        if (!file.is_open())
        {
            std::cerr << "\033[1m\033[31mfatal error: \x1B[0mFailed to open file " << argv[1] << std::endl;
            std::cerr << std::strerror(errno) << std::endl;
            return EXIT_FAILURE;
        }

        input = &file;
    }

    // Create lexer object
    auto lexer = createLexer(input);
    int tok;

    while ((tok = lexer->yylex()) != 0)
    {
        std::cout << "line: " << lexer->getLine() << " token: " << getName(tok) << " Lexeme: "
                  << lexer->lexeme << "\n";
        lexer->lexeme = ""; // *** LOOK FOR A BETTER WAY TO CLEAR THE LEXEME ***
    }

    if (file.is_open())
        file.close();

    return EXIT_SUCCESS;
}
