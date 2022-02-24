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
    #include "ast.hpp"

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
    AST* node;
    
};

/* Tokens 
    The character representations can only be used inside bison
*/


%token <strVal> ID "ID"

%token TRUE "true"

%token FALSE "false"

%token BOOLEAN "boolean"

%token INT "int"

%token <node> VOID "void"

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
%type <node> globaldeclarations
%type <node> globaldeclaration
%type <node> variabledeclaration
%type <node> identifier
%type <node> functiondeclaration
%type <node> functionheader
%type <node> functiondeclarator
%type <node> formalparameterlist
%type <node> formalparameter
%type <node> mainfunctiondeclaration
%type <node> mainfunctiondeclarator
%type <node> block
%type <node> blockstatements
%type <node> blockstatement
%type <node> statement
%type <node> statementexpression
%type <node> primary
%type <node> argumentlist
%type <node> functioninvocation
%type <node> postfixexpression
%type <node> unaryexpression
%type <node> multiplicativeexpression
%type <node> additiveexpression
%type <node> relationalexpression
%type <node> equalityexpression
%type <node> conditionalandexpression
%type <node> conditionalorexpression
%type <node> assignmentexpression
%type <node> assignment
%type <node> expression
%type <node> literal
%type <node> type
%type <node> start

%%
start           : %empty /* empty */        {driver.tree = new Prog(std::string(driver.getFileName().c_str()));}   
                | globaldeclarations        {driver.tree = $1;}
                ;

literal         : NUM                   {$$ = new AST("number " + std::to_string($1));}
                | STRING                {$$ = new AST(*$1);}
                | TRUE                  {$$ = new AST("TRUE");}
                | FALSE                 {$$ = new AST("FALSE");}
                ;

type            : BOOLEAN               {$$ = new AST("type integer");}
                | INT                   {$$ = new AST("type boolean");}
                ;

globaldeclarations      : globaldeclaration {$$ = new Prog(std::string(driver.getFileName().c_str()),{$1});}
                        | globaldeclarations globaldeclaration {$$->addNodes({$2});}
                        ;

globaldeclaration       : variabledeclaration
                        | functiondeclaration
                        | mainfunctiondeclaration
                        ;

variabledeclaration     : type identifier SEM {$$ = new AST( "variable decleration",{$1,$2});}
                        ;

identifier              : ID {$$ = new AST("identifier " + *$1);}
                        ;

functiondeclaration     : functionheader block {$$ = new AST( "function decleration",{$1,$2});}
                        ;

functionheader          : type functiondeclarator {$$ = new AST( "function header",{$1,$2});}
                        | VOID functiondeclarator {$$ = new AST( "function header",{$2});}
                        ;

functiondeclarator      : identifier LPAR formalparameterlist RPAR {$$ = new AST( "function declarator",{$1,$3});}
                        | identifier LPAR RPAR {$$ = new AST( "function declarator",{$1});}
                        ;

formalparameterlist     : formalparameter {$$ = new AST( "formal parameter list",{$1});}
                        | formalparameterlist COM formalparameter {$$->addNodes({$3});}
                        ;

formalparameter         : type identifier {$$ = new AST( "formal paramater",{$1, $2});}
                        ;

mainfunctiondeclaration : mainfunctiondeclarator block {$$ = new AST( "main function decleration",{$1, $2});}
                        ;

mainfunctiondeclarator  : identifier LPAR RPAR {$$ = new AST( "main function declerator",{$1});}
                        ;

block                   : LBRC blockstatements RBRC {$$ = new AST( "block",{$2});}
                        | LBRC RBRC {$$ = new AST( "block");}
                        ;

blockstatements         : blockstatement 
                        | blockstatements blockstatement {$$->addNodes({$2});}
                        ;

blockstatement          : variabledeclaration
                        | statement
                        ;

statement               : block
                        | SEM { $$ = new AST( "null statement"); }
                        | statementexpression SEM { $$ = new AST( "statement expression", {$1});}
                        | BREAK SEM { $$ = new AST( "break"); }
                        | RETURN expression SEM { $$ = new AST( "return", {$2}); }
                        | RETURN SEM { $$ = new AST( "return"); }
                        | IF LPAR expression RPAR statement { $$ = new AST( "if", {$3, $5}); }
                        | IF LPAR expression RPAR statement ELSE statement { $$ = new AST( "if else", {$3, $5, $7}); }
                        | WHILE LPAR expression RPAR statement { $$ = new AST( "while", {$3, $5}); }
                        ;

statementexpression     : assignment 
                        | functioninvocation { $$ = new AST( "statement expression", {$1}); }
                        ;

primary                 : literal
                        | LPAR expression RPAR  { $$ = $2; }
                        | functioninvocation
                        ;

argumentlist            : expression { $$ = new AST( "argument list", {$1}); }
                        | argumentlist COM expression {$$->addNodes({$3});}
                        ;

functioninvocation      : identifier LPAR argumentlist RPAR { $$ = new AST( "function call", {$1, $3}); }
                        | identifier LPAR RPAR { $$ = new AST( "function call", {$1}); }
                        ;

postfixexpression       : primary
                        | identifier
                        ;

unaryexpression         : SUB unaryexpression { $$ = new AST( "-", {$2}); }
                        | NOT unaryexpression { $$ = new AST( "!", {$2}); }
                        | postfixexpression
                        ;

multiplicativeexpression: unaryexpression
                        | multiplicativeexpression MULT unaryexpression { $$ = new AST( "*", {$1,$3}); }
                        | multiplicativeexpression DIV unaryexpression  { $$ = new AST( "/", {$1,$3}); }
                        | multiplicativeexpression PS unaryexpression   { $$ = new AST( "%", {$1,$3}); }
                        ;

additiveexpression      : multiplicativeexpression
                        | additiveexpression ADD multiplicativeexpression { $$ = new AST( "+", {$1,$3}); }
                        | additiveexpression SUB multiplicativeexpression { $$ = new AST( "-", {$1,$3}); }
                        ;

relationalexpression    : additiveexpression
                        | relationalexpression LT additiveexpression { $$ = new AST( "<", {$1,$3}); }
                        | relationalexpression GT additiveexpression { $$ = new AST( ">", {$1,$3}); }
                        | relationalexpression LE additiveexpression { $$ = new AST( "<=", {$1,$3}); }
                        | relationalexpression GE additiveexpression { $$ = new AST( ">=", {$1,$3}); }
                        ;

equalityexpression      : relationalexpression
                        | equalityexpression DEQ relationalexpression { $$ = new AST( "==", {$1,$3}); }
                        | equalityexpression NEQ relationalexpression { $$ = new AST( "!=", {$1,$3}); }
                        ;

conditionalandexpression: equalityexpression
                        | conditionalandexpression AND equalityexpression { $$ = new AST( "&&", {$1,$3}); }
                        ;

conditionalorexpression : conditionalandexpression
                        | conditionalorexpression OR conditionalandexpression { $$ = new AST( "||", {$1,$3}); }
                        ;

assignmentexpression    : conditionalorexpression
                        | assignment
                        ;

assignment              : identifier EQ assignmentexpression  { $$ = new AST( "=", {$1,$3}); }
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

