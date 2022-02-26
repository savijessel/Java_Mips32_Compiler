#ifndef DRIVER_HPP
#define DRIVER_HPP

#include <string>
#include <istream>

#include "scanner.hpp"
#include "parser.hh"
#include "ast.hpp"

class Driver
{
public:
    Driver(const char *file) : file_name(file) {}

    ~Driver();

    // Will start the compilation of the file
    bool start(std::istream &in);

    // Stores AST. Parser will fill this.
    AST *tree = nullptr;

    std::string getFileName() { return file_name; }

    // Makes it easy to debug. Parser will set this as yylex.
    // getToken will then actually call yylex, print out the token if needed and returns the token
    // No modification of the token or it's attribute should be done here.
    virtual int getToken(JCC::Parser::semantic_type *yylval, JCC::Parser::location_type *location);

private:
    std::string file_name;
    bool parse(std::istream &in);
    std::unique_ptr<JCC::Parser> parser{nullptr};
    std::unique_ptr<JCC::Lexer> lexer{nullptr};
};

#endif