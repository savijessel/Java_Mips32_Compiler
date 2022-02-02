/********************************
 * This file contains code adapted from tutorial code provided by the TA
 * TA - Shankar Ganesh
 * Reference File - scanner.cpp
 * *****************************/

#include <FlexLexer.h>
#include "scanner.hpp"
#include <cstdlib>
#include <cerrno>
#include <cstring>

int main(int argc, char **argv)
{
    std::istream *input;

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
        if (tok == EXIT_FAILURE)
        {
            return EXIT_FAILURE;
        }
        std::cout << "line: " << lexer->getLine() << " | token: " << getName(tok) << " | Lexeme: "
                  << lexer->lexeme << "\n";
        lexer->lexeme = ""; // *** LOOK FOR A BETTER WAY TO CLEAR THE LEXEME ***
    }

    if (file.is_open())
        file.close();

    return EXIT_SUCCESS;
}
