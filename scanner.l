%option c++
%option yyclass="CCLexer"
%option yylineno
%option noyywrap

/* Declarations */
%{
    // Declarations go here
    #include <iostream>
    #include <fstream>
    #include <string>
    #include "scanner.hpp"
    
    //static std::string strBuffer;
    
%}

/* Definitions here */
alpha       [a-zA-Z]
digit       [0-9]
escape      \\[bftrn0'"\\]
strChar     [^\"\n\\]




num         {digit}{digit}*
ID          {alpha}({alpha}|{digit})*


/* Comment States */
%x COMMENT

/* String State */
%x STRING

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
"%"         return T_PS;
"="         return T_EQ;
"=="        return T_DEQ;
"!="        return T_NEQ;
"!"         return T_EX;
"&&"        return T_AND;
"||"        return T_OR;
";"         return T_SEM;
","         return T_COM;
"("         return T_LPAR;
")"         return T_RPAR;
"{"         return T_LBRC;
"}"         return T_RBRC;
"true"      return T_TRUE;
"false"     return T_FALSE;
"boolean"   return T_BOOLEAN;
"int"       return T_INT;
"void"      return T_VOID;  
"if"        return T_IF;
"else"      return T_ELSE;  
"while"     return T_WHILE;
"break"     return T_BREAK;
"return"    return T_RETURN;

{ID}        {lexeme = std::string(YYText()); return T_ID;}
{num}       {lexeme = std::string(YYText()); return T_NUM;}


"//"            BEGIN(COMMENT);
<COMMENT>.
<COMMENT>\n     {BEGIN(INITIAL); std::cout << "Detected comment at or near line " << yylineno << std::endl;}

\"              {yymore(); BEGIN(STRING);}




<STRING><<EOF>>                  {std::cerr << "Missing string end quote at or near line " << yylineno << std::endl; return EXIT_SUCCESS;}
<STRING>({escape}|{strChar})        {yymore();}
<STRING>\"       {lexeme = std::string(YYText()); BEGIN(INITIAL); return T_STRING;}
<STRING>\n       {std::cerr << "Detected a newline in a string at or near line " << yylineno << std::endl; return EXIT_FAILURE;} 
<STRING>(\\[^bftrn0'"\\])      {std::cerr << "Detected an invalid escape in a string at or near line " << yylineno << std::endl; return EXIT_FAILURE;}







.                 std::cerr << "Detected an illegal character at line " << yylineno << std::endl;

%% 

/* User routines here*/

/* int yyFlexLexer::yywrap() { return 1; } */

/* Creates and returns unique pointer to lexer */
std::unique_ptr<CCLexer> createLexer(std::istream* input) {
    return std::make_unique<CCLexer>(input);
}
