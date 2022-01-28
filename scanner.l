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
    
    static std::string strBuffer;
    
%}

/* Definitions here */
alpha       [a-zA-Z]
digit       [0-9]



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

\"                  {BEGIN(STRING); strBuffer.clear();}


<STRING><<EOF>>     {std::cerr << "Reached End of File"<< std::endl; return EXIT_SUCCESS;}
<STRING>[^\\]*   {strBuffer = strBuffer + std::string(YYText());}
<STRING>\\n         {strBuffer = strBuffer + std::string(YYText());}
<STRING>\\t         {strBuffer = strBuffer + std::string(YYText());}


<STRING>\n          {std::cerr << "Detected a newline in a string at line " << yylineno << std::endl;}
<STRING>\"          {BEGIN(INITIAL); lexeme = strBuffer; return T_STRING; }


.                   std::cerr << "Detected an illegal character at line " << yylineno << std::endl;

%% 

/* User routines here*/

/* int yyFlexLexer::yywrap() { return 1; } */

/* Creates and returns unique pointer to lexer */
std::unique_ptr<CCLexer> createLexer(std::istream* input) {
    return std::make_unique<CCLexer>(input);
}

