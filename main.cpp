/********************************
 * This file contains code adapted from tutorial code provided by the TA
 * TA - Shankar Ganesh
 * Reference File - scanner.cpp
 * *****************************/

#include <cstdlib>
#include <cerrno>
#include <cstring>
#include <iostream>
#include <fstream>

#include "scanner.hpp"
#include "parser.hh"

int main(int argc, char **argv)
{

    std::istream *input = &std::cin; // FIX THIS LATER

    std::ifstream file;

    if (argc == 2)
    {
        file.open(argv[1]);

        if (!file.good())
        {
            std::cerr << "Error: " << strerror(errno) << "\n";
            return EXIT_FAILURE;
        }

        input = &file;
    }

    auto lexer = createLexer(input);
    auto parser = std::make_unique<JCC::Parser>(lexer);

    if (parser->parse() != 0)
    {
        std::cerr << "Parse failed!!\n";
        if (file.is_open())
            file.close();
        return 1;
    }

    if (file.is_open())
        file.close();

    return 0;
}
