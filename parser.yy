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

/* The following are all of symbols from the grammar */
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


start           : %empty /* empty */        {driver.tree = new Prog(std::string(driver.getFileName().c_str()), 
                                             NodeName::program, @$.begin.line);}   
                | globaldeclarations        {driver.tree = $1;}
                ;

literal         : NUM                   {$$ = new AST("number', 'Attr': " + std::to_string($1), NodeName::literal, @$.begin.line);}

                | STRING                {std::string input = *$1; input.replace(input.find('\0'),1,"\\x00"); 
                                         $$ = new AST("string', 'Attr': " + input, NodeName::literal, @$.begin.line); 
                                         std::cout<<*$1<<std::endl;}

                | TRUE                  {$$ = new AST("boolean', Attr': TRUE", NodeName::literal, @$.begin.line);}
                | FALSE                 {$$ = new AST("boolean', Attr': FALSE", NodeName::literal, @$.begin.line);}
                ;

type            : BOOLEAN               {$$ = new AST("boolean", NodeName::type, @$.begin.line);}
                | INT                   {$$ = new AST("integer", NodeName::type, @$.begin.line);}
                ;

globaldeclarations      : globaldeclaration {$$ = new Prog(std::string(driver.getFileName().c_str()),NodeName::program,{$1},@$.begin.line);}
                        | globaldeclarations globaldeclaration {$$->addNodes({$2}); $$->lineNum = @$.begin.line;}
                        ;

globaldeclaration       : variabledeclaration 
                        | functiondeclaration
                        | mainfunctiondeclaration
                        ;

variabledeclaration     : type identifier SEM {$$ = new AST(NodeName::variabledeclaration,{$1,$2},@$.begin.line);}
                        ;

identifier              : ID {$$ = new AST(*$1,NodeName::identifier,@$.begin.line);}
                        ;

functiondeclaration     : functionheader block {$$ = new AST(NodeName::functiondeclaration,{$1,$2},@$.begin.line);}
                        ;

functionheader          : type functiondeclarator {$$ = new AST("",NodeName::functionheader,{$1,$2},@$.begin.line);}
                        | VOID functiondeclarator {$$ = new AST( "void",NodeName::functionheader,{$2},@$.begin.line);}
                        ;

functiondeclarator      : identifier LPAR formalparameterlist RPAR {$$ = new AST(NodeName::functiondeclarator,{$1,$3},@$.begin.line);}
                        | identifier LPAR RPAR {$$ = new AST(NodeName::functiondeclarator,{$1},@$.begin.line);}
                        ;

formalparameterlist     : formalparameter {$$ = new AST(NodeName::formalparameterlist,{$1},@$.begin.line);}
                        | formalparameterlist COM formalparameter {$$->addNodes({$3}); $$->lineNum = @$.begin.line;}
                        ;

formalparameter         : type identifier {$$ = new AST(NodeName::formalparameter,{$1, $2},@$.begin.line);}
                        ;

mainfunctiondeclaration : mainfunctiondeclarator block {$$ = new AST(NodeName::mainfunctiondeclaration,{$1, $2},@$.begin.line);}
                        ;

mainfunctiondeclarator  : identifier LPAR RPAR {$$ = new AST(NodeName::mainfunctiondeclarator,{$1},@$.begin.line);}
                        ;

block                   : LBRC blockstatements RBRC {$$ = new AST(NodeName::block,{$2},@$.begin.line);}
                        | LBRC RBRC {$$ = new AST(NodeName::block,@$.begin.line);}
                        ;

blockstatements         : blockstatement {$$ = new AST(NodeName::blockstatements,{$1},@$.begin.line);}
                        | blockstatements blockstatement {$$->addNodes({$2}); $$->lineNum = @$.begin.line;}
                        ;

blockstatement          : variabledeclaration
                        | statement
                        ;

statement               : block
                        | SEM { $$ = new AST( NodeName::nullstm,@$.begin.line); }
                        | statementexpression SEM { $$ = $1; $$->lineNum = @$.begin.line;}
                        | BREAK SEM { $$ = new AST(NodeName::breakstm,@$.begin.line); }
                        | RETURN expression SEM { $$ = new AST(NodeName::returnstm, {$2},@$.begin.line); }
                        | RETURN SEM { $$ = new AST(NodeName::returnstm,@$.begin.line); }
                        | IF LPAR expression RPAR statement { $$ = new AST("", NodeName::ifstm, {$3, $5},@$.begin.line); }
                        | IF LPAR expression RPAR statement ELSE statement { $$ = new AST( "if else statement",NodeName::ifstm, {$3, $5, $7},@$.begin.line); }
                        | WHILE LPAR expression RPAR statement { $$ = new AST(NodeName::whilestm, {$3, $5},@$.begin.line); }
                        ;

statementexpression     : assignment { $$ = new AST( "assignment", NodeName::statementexpression, {$1},@$.begin.line); }
                        | functioninvocation { $$ = new AST( "function call", NodeName::statementexpression, {$1},@$.begin.line); }
                        ;

primary                 : literal
                        | LPAR expression RPAR  {$$ = $2; $$->lineNum = @$.begin.line;}
                        | functioninvocation
                        ;

argumentlist            : expression { $$ = new AST( NodeName::argumentlist, {$1},@$.begin.line); }
                        | argumentlist COM expression {$$->addNodes({$3}); $$->lineNum = @$.begin.line;}
                        ;

functioninvocation      : identifier LPAR argumentlist RPAR { $$ = new AST(NodeName::functioncall, {$1, $3},@$.begin.line); }
                        | identifier LPAR RPAR { $$ = new AST(NodeName::functioncall, {$1},@$.begin.line); }
                        ;

postfixexpression       : primary
                        | identifier
                        ;

unaryexpression         : SUB unaryexpression { $$ = new AST( "-", NodeName::unop, {$2},@$.begin.line); }
                        | NOT unaryexpression { $$ = new AST( "!", NodeName::unop, {$2}, @$.begin.line); }
                        | postfixexpression
                        ;

multiplicativeexpression: unaryexpression
                        | multiplicativeexpression MULT unaryexpression { $$ = new AST( "*", NodeName::binop, {$1,$3},@$.begin.line); }
                        | multiplicativeexpression DIV unaryexpression  { $$ = new AST( "/", NodeName::binop, {$1,$3},@$.begin.line); }
                        | multiplicativeexpression PS unaryexpression   { $$ = new AST( "%", NodeName::binop, {$1,$3},@$.begin.line); }
                        ;

additiveexpression      : multiplicativeexpression
                        | additiveexpression ADD multiplicativeexpression { $$ = new AST( "+", NodeName::binop, {$1,$3},@$.begin.line); }
                        | additiveexpression SUB multiplicativeexpression { $$ = new AST( "-", NodeName::binop, {$1,$3},@$.begin.line); }
                        ;

relationalexpression    : additiveexpression
                        | relationalexpression LT additiveexpression { $$ = new AST( "<", NodeName::binop, {$1,$3},@$.begin.line); }
                        | relationalexpression GT additiveexpression { $$ = new AST( ">", NodeName::binop, {$1,$3},@$.begin.line); }
                        | relationalexpression LE additiveexpression { $$ = new AST( "<=", NodeName::binop, {$1,$3},@$.begin.line); }
                        | relationalexpression GE additiveexpression { $$ = new AST( ">=", NodeName::binop, {$1,$3},@$.begin.line); }
                        ;

equalityexpression      : relationalexpression
                        | equalityexpression DEQ relationalexpression { $$ = new AST( "==", NodeName::binop, {$1,$3},@$.begin.line); }
                        | equalityexpression NEQ relationalexpression { $$ = new AST( "!=", NodeName::binop, {$1,$3},@$.begin.line); }
                        ;

conditionalandexpression: equalityexpression
                        | conditionalandexpression AND equalityexpression { $$ = new AST( "&&", NodeName::binop, {$1,$3},@$.begin.line); }
                        ;

conditionalorexpression : conditionalandexpression
                        | conditionalorexpression OR conditionalandexpression { $$ = new AST( "||", NodeName::binop, {$1,$3},@$.begin.line); }
                        ;

assignmentexpression    : conditionalorexpression
                        | assignment
                        ;

assignment              : identifier EQ assignmentexpression  { $$ = new AST( "=", NodeName::assignment, {$1,$3},@$.begin.line); }
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

