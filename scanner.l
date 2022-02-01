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
alpha               [a-zA-Z_]
digit               [0-9]
escapeChar          \\[bftrn'"\\]
invalidEscapeChar   \\[^bftrnx'"\\]
strChar             [^\"\n\\]




num                 {digit}{digit}*
ID                  {alpha}({alpha}|{digit})*


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


"//"        BEGIN(COMMENT);

\"          {yymore(); BEGIN(STRING);}

.           {if(scanWarning("Illegal character", yylineno))
                return EXIT_FAILURE;}
            

<COMMENT>.
<COMMENT><<EOF>>                    {BEGIN(INITIAL); std::cout << "Detected comment at or near line " << yylineno << std::endl;}
<COMMENT>\n                         {BEGIN(INITIAL); std::cout << "Detected comment at or near line " << yylineno << std::endl;}






<STRING><<EOF>>                     {return scanError("Missing string end quote", yylineno);}
<STRING>\"                          {lexeme = std::string(YYText()); BEGIN(INITIAL); return T_STRING;}
<STRING>({escapeChar}|{strChar})    {yymore();}
<STRING>\n                          {return scanError("Newline in string", yylineno);} 
<STRING>{invalidEscapeChar}         {return scanError("Invalid escape character", yylineno);}



%% 

/* User routines here*/

/* int yyFlexLexer::yywrap() { return 1; } */

/* Creates and returns unique pointer to lexer */
std::unique_ptr<CCLexer> createLexer(std::istream* input) {
    return std::make_unique<CCLexer>(input);
}



