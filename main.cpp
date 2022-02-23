/********************************
 * Example C++ Parser
 * Written for CPSC 411 Tutorial
 * File: scanner.cpp
 * Shankar Ganesh
 * *****************************/

#include <cstdlib>
#include <cerrno>
#include <cstring>
#include "driver.hpp"

int main(int argc, char **argv)
{

    // Create a driver.
    // Driver can be considered an instance of my compiler
    Driver *driver;
    std::istream *input = &std::cin;

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

    // The constructor just sets the filename, does not open the file
    // You can fix this in your implementation
    (argc == 2) ? driver = new Driver(argv[1]) : driver = new Driver("stdin");

    bool res = driver->start(*input);

    if (file.is_open())
        file.close();

    return res;
}