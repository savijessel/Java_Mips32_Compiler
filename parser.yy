/* Simple C++ Parser Example */

/* Need to have this line, if generating a c++ parser */
%skeleton "lalr1.cc"
%require "3.5.1"

// Generate header files
%defines

// Namespace where the parser class is. Default: yy
%define api.namespace {JCC} 

// Name of the parser class. Default: parser
%define api.parser.class {Parser} 

// Enable location tracking
%locations 

/* Any type that is used in union should be included or decalred here 
    (in the requires qualifier) 
*/
%code requires{
    // Used for parse-param
    #include <memory>

    // Forward Declaration.
    // Compiler outputs error otherwise
    namespace JCC {
        class Lexer;
    }

}

/* Add a parameter to parse function. */
%parse-param {std::unique_ptr<JCC::Lexer> &lexer}

/* Any other includes or C/C++ code can go in %code and 
    bison will place it somewhere optimal */
%code {
    #include <iostream>
    #include <fstream>
    #include "scanner.hpp"

    // Undefine the normal yylex.
    // Bison will search for a yylex function in the global namespace
    // But one doesn't exist! It's in the lexer class. 
    // So define yylex.
    #undef yylex
    #define yylex lexer->yylex
}

/* Prefix all tokens with T_ */
%define api.token.prefix {T_}

/* Semantic type (YYSTYPE) */
%union{
    std::string* strVal;
    int ival;
};

/* Tokens 
    The character representations can only be used inside bison
*/


%token ID "ID"

%token TRUE "true"

%token FALSE "false"

%token BOOLEAN "boolean"

%token INT "int"

%token VOID "void"

%token IF "if"

%token ELSE "else"

%token WHILE "while"

%token BREAK "break"

%token RETURN "return"

/* NUM has an attribute and is of type ival (int in union) */

%token <ival> NUM "NUM"

%token ADD "+"

%token SUB "-"

%token DIV "/"

%token MULT "*"

%token LT "<"

%token GT ">"

%token LE "<="

%token GE ">="

%token PS "%"

%token EQ "="

%token DEQ "=="

%token NEQ "!="

%token EX  "!"

%token AND "&&"

%token OR "||"

%token SEM ";"

%token COM  ","

%token LPAR "("

%token RPAR ")"

%token LBRC "{"

%token RBRC  "}"

/* STRING has an attribute and is of type strVal (String in union) */

%token <strVal> STRING "string"



/* Define the start symbol */
%start S

/* The symbols E and F are of type int and return an int */
%type <ival> E F

%%

S	: E		        {printf("%d\n", $1);}
	;

E	: E "+" F		{$$ = $1 + $3;}
	| E MULT F	{$$ = $1 * $3;}
	| E DIV F		{$$ = $1 / $3;}
	| E PS F		{$$ = $1 % $3;}
	| E SUB F		{$$ = $1 - $3;}
    | "(" E ")"     {$$ = $2;}
	| F				{$$ = $1;}
	;

F	: NUM			{$$ = $1;}


%%

/* Parser will call this function when it fails to parse */
/* Tip: You can store the current token in the lexer to output meaningful error messages */
void JCC::Parser::error(const location_type &loc, const std::string &errmsg)
{
   std::cerr << "Error: " << errmsg << " at " << loc << "\n";
}

