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
    #include <vector>
    #include <iostream>
    #include <string>

    // Forward Declaration.
    // Compiler outputs error otherwise
    class Driver;

}

/* Add a parameter to parse function. */
%parse-param {Driver &driver}

/* Any other includes or C/C++ code can go in %code and 
    bison will place it somewhere optimal */
%code {
    #include <iostream>
    #include <fstream>
    #include "driver.hpp"

    // Undefine the normal yylex.
    // Bison will search for a yylex function in the global namespace
    // But one doesn't exist! It's in the lexer class. 
    // So define yylex.
    #undef yylex
    #define yylex driver.getToken
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

%token NOT  "!"

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
%start start

/* The symbols E and F are of type int and return an int */


%%
start           : /* empty */           {std::cout<<"start"<<std::endl;}
                | globaldeclarations    {std::cout<<"start"<<std::endl;}
                ;

literal         : NUM                   {std::cout<<"NUMBER"<<std::endl;}
                | STRING                {std::cout<<"STRING"<<std::endl;}
                | TRUE                  {std::cout<<"TRUE"<<std::endl;}
                | FALSE                 {std::cout<<"FALSE"<<std::endl;}
                ;

type            : BOOLEAN               {std::cout<<"BOOLEAN"<<std::endl;}
                | INT                   {std::cout<<"INT"<<std::endl;}
                ;

globaldeclarations      : globaldeclaration
                        | globaldeclarations globaldeclaration
                        ;

globaldeclaration       : variabledeclaration
                        | functiondeclaration
                        | mainfunctiondeclaration
                        ;

variabledeclaration     : type identifier SEM
                        ;

identifier              : ID
                        ;

functiondeclaration     : functionheader block
                        ;

functionheader          : type functiondeclarator
                        | VOID functiondeclarator
                        ;

functiondeclarator      : identifier LPAR formalparameterlist RPAR
                        | identifier LPAR RPAR
                        ;

formalparameterlist     : formalparameter
                        | formalparameterlist COM formalparameter
                        ;

formalparameter         : type identifier
                        ;

mainfunctiondeclaration : mainfunctiondeclarator block
                        ;

mainfunctiondeclarator  : identifier LPAR RPAR
                        ;

block                   : LBRC blockstatements RBRC
                        | LBRC RBRC
                        ;

blockstatements         : blockstatement
                        | blockstatements blockstatement
                        ;

blockstatement          : variabledeclaration
                        | statement
                        ;

statement               : block
                        | SEM
                        | statementexpression SEM
                        | BREAK SEM
                        | RETURN expression SEM
                        | RETURN SEM
                        | IF LPAR expression RPAR statement
                        | IF LPAR expression RPAR statement ELSE statement
                        | WHILE LPAR expression RPAR statement
                        ;

statementexpression     : assignment
                        | functioninvocation
                        ;

primary                 : literal
                        | LPAR expression RPAR
                        | functioninvocation
                        ;

argumentlist            : expression
                        | argumentlist COM expression
                        ;

functioninvocation      : identifier LPAR argumentlist RPAR
                        | identifier LPAR RPAR
                        ;

postfixexpression       : primary
                        | identifier
                        ;

unaryexpression         : SUB unaryexpression
                        | NOT unaryexpression
                        | postfixexpression
                        ;

multiplicativeexpression: unaryexpression
                        | multiplicativeexpression MULT unaryexpression
                        | multiplicativeexpression DIV unaryexpression
                        | multiplicativeexpression PS unaryexpression
                        ;

additiveexpression      : multiplicativeexpression
                        | additiveexpression ADD multiplicativeexpression
                        | additiveexpression SUB multiplicativeexpression
                        ;

relationalexpression    : additiveexpression
                        | relationalexpression LT additiveexpression
                        | relationalexpression GT additiveexpression
                        | relationalexpression LE additiveexpression
                        | relationalexpression GE additiveexpression
                        ;

equalityexpression      : relationalexpression
                        | equalityexpression DEQ relationalexpression
                        | equalityexpression NEQ relationalexpression
                        ;

conditionalandexpression: equalityexpression
                        | conditionalandexpression AND equalityexpression
                        ;

conditionalorexpression : conditionalandexpression
                        | conditionalorexpression OR conditionalandexpression
                        ;

assignmentexpression    : conditionalorexpression
                        | assignment
                        ;

assignment              : identifier EQ assignmentexpression    {std::cout<<"equals"<<std::endl;}
                        ;

expression              : assignmentexpression
                        ;
%%

/* Parser will call this function when it fails to parse */
/* Tip: You can store the current token in the lexer to output meaningful error messages */
void JCC::Parser::error(const location_type &loc, const std::string &errmsg)
{
   std::cerr << "Error: " << errmsg << " at " << loc << "\n";
}

