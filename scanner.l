/********************************
 * This file contains code adapted from tutorial code provided by the TA
 * TA - Shankar Ganesh
 * Reference File - scanner.l
 * *****************************/
%option c++
%option yyclass="JCC::Lexer"
%option noyywrap

/* Declarations */
%{
    // Declarations go here
    #include <iostream>
    #include <fstream>
    #include "scanner.hpp"
    #include "parser.hh"

    using Token = JCC::Parser::token;

     
    #undef  YY_DECL
    #define YY_DECL int JCC::Lexer::yylex(JCC::Parser::semantic_type *yylval, JCC::Parser::location_type *loc)

    // Everytime yylex is called, the location is updated for a token
    // loc->step() sets the begin character for the token. 
    // And loc->columns sets the number of characters for the token
    #define YY_USER_ACTION loc->step(); loc->columns(yyleng);

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
\n          loc->lines(); loc->step(); 

">"         return Token::T_GT;
"<"         return Token::T_LT;
">="        return Token::T_GE;
"<="        return Token::T_LE;
"+"         return Token::T_ADD;
"-"         return Token::T_SUB;
"/"         return Token::T_DIV;
"*"         return Token::T_MULT;
"%"         return Token::T_PS;
"="         return Token::T_EQ;
"=="        return Token::T_DEQ;
"!="        return Token::T_NEQ;
"!"         return Token::T_NOT;
"&&"        return Token::T_AND;
"||"        return Token::T_OR;
";"         return Token::T_SEM;
","         return Token::T_COM;
"("         return Token::T_LPAR;
")"         return Token::T_RPAR;
"{"         return Token::T_LBRC;
"}"         return Token::T_RBRC;
"true"      return Token::T_TRUE;
"false"     return Token::T_FALSE;
"boolean"   return Token::T_BOOLEAN;
"int"       return Token::T_INT;
"void"      return Token::T_VOID;  
"if"        return Token::T_IF;
"else"      return Token::T_ELSE;  
"while"     return Token::T_WHILE;
"break"     return Token::T_BREAK;
"return"    return Token::T_RETURN;

{ID}        {yylval->strVal = new std::string(YYText()); return Token::T_ID;}
{num}       {yylval->ival = std::stoi(YYText()); return Token::T_NUM;}


"//"        BEGIN(COMMENT);                                    

\"          BEGIN(STRING);                                      

    /* If the token failed to match any of the rules above, output a warning */
    /* Exit if the return from scanWarning() indicates at least 10 warnings have occured */ 
.           {if(scanWarning("Illegal character", *loc))     
                return EXIT_FAILURE;}                           
            

    /* While in the comment state, ignore all characters except /n */
    /* Exit the state if a newline or EOF are detected */
<COMMENT>.
<COMMENT><<EOF>>                   loc->lines();
<COMMENT>\n                        {BEGIN(INITIAL); loc->lines();}

<STRING><<EOF>>                     {return scanError("Missing string end quote", *loc); loc->lines();}

    /* If an end quote is detected, convert YYText() to a std::string */
    /* YYLeng()-1 is specified to handle \0 and strip off the end quote */
<STRING>\"                          {yylval->strVal = new std::string(YYText(),YYLeng()-1); BEGIN(INITIAL); return Token::T_STRING;}

    /* Include any escape characters, "regular" characters, or null characters in the string */
<STRING>({escapeChar}|{strChar}|\0) {yymore();} 

<STRING>\n                          {return scanError("Newline in string", *loc);}

    /* Output an error if any invalid escape characters are detected */
<STRING>{invalidEscapeChar}         {return scanError("Invalid escape character", *loc);}



%% 

/* User routines here*/


/* Creates and returns unique pointer to lexer */
std::unique_ptr<JCC::Lexer> createLexer(std::istream* input) {
    return std::make_unique<JCC::Lexer>(input);
}



