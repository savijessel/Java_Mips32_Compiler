/********************************
 * This file contains code adapted from tutorial code provided by the TA
 * TA - Shankar Ganesh
 * Reference File - scanner.l
 * *****************************/
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

/* escape characters such as \b,\f,\t,\r,\n,\',\",\\ */
escapeChar          \\[bftrn'"\\] 

/* any escape character except those mentioned above */
invalidEscapeChar   \\[^bftrnx'"\\]   

/* any characters except quote characters, newlines, and slash characters */
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

\"          BEGIN(STRING);                                      

    /* If the token failed to match any of the rules above, output a warning */
    /* Exit if the return from scanWarning() indicates at least 10 warnings have occured */ 
.           {if(scanWarning("Illegal character", yylineno))     
                return EXIT_FAILURE;}                           
            

    /* While in the comment state, ignore all characters except /n */
    /* Exit the state if a newline or EOF are detected */
<COMMENT>.
<COMMENT><<EOF>>                    BEGIN(INITIAL);
<COMMENT>\n                         BEGIN(INITIAL);

<STRING><<EOF>>                     {return scanError("Missing string end quote", yylineno);}

    /* If an end quote is detected, convert YYText() to a std::string */
    /* YYLeng()-1 is specified to handle \0 and strip off the end quote */
<STRING>\"                          {lexeme = std::string(YYText(),YYLeng()-1); BEGIN(INITIAL); return T_STRING;}

    /* Include any escape characters, "regular" characters, or null characters in the string */
<STRING>({escapeChar}|{strChar}|\0) {yymore();} 

<STRING>\n                          {return scanError("Newline in string", yylineno);}

    /* Output an error if any invalid escape characters are detected */
<STRING>{invalidEscapeChar}         {return scanError("Invalid escape character", yylineno);}



%% 

/* User routines here*/


/* Creates and returns unique pointer to lexer */
std::unique_ptr<CCLexer> createLexer(std::istream* input) {
    return std::make_unique<CCLexer>(input);
}



