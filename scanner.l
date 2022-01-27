%option c++
%option yyclass="CCLexer"
%option yylineno
%option noyywrap

/* Declarations */
%{
    // Declarations go here
    #include <iostream>
    #include <fstream>
    #include "scanner.hpp"
    
%}

/* Definitions here */
alpha       [a-zA-Z]
digit       [0-9]


num     {digit}{digit}*
ID      {alpha}({alpha}|{digit})*

/* Comment States */
%x COMMENT

%% 

 /* Rules here */
[ \t\r]+    ;          
\n          ; 

">"         return T_GT;
"<"         return T_LT;
">="        return T_GE;
"<="        return T_LE;
"+"         return T_ADD;
"-"         return T_SUB;
"/"         return T_DIV;
"*"         return T_MULT;
"true"      return T_TRUE;
"false"     return T_FALSE;
"boolean"   return T_BOOLEAN;
"int"       {lexeme = std::string(YYText()); return T_INT;}
"void"      return T_VOID;  
"if"        return T_IF;
"else"      return T_ELSE;  
"while"     return T_WHILE;
"break"     return T_BREAK;
"return"    return T_RETURN;

{ID}        {lexeme = std::string(YYText()); return T_ID;}
{num}       return T_NUM;


"//"            BEGIN(COMMENT);
<COMMENT>.
<COMMENT>\n     {BEGIN(INITIAL); std::cout << "Detected comment at or near line " << yylineno << "\n"; }

.               std::cerr << "Detected an illegal character at line " << yylineno << std::endl;

%% 

/* User routines here*/

/* int yyFlexLexer::yywrap() { return 1; } */

/* Creates and returns unique pointer to lexer */
std::unique_ptr<CCLexer> createLexer(std::istream* input) {
    return std::make_unique<CCLexer>(input);
}

