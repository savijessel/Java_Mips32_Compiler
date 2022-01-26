// Note: This code was taken from the TA, Shankar Ganesh, from a tutorial video



%{
#include <stdio.h>
%}

%%
.   {printf("%s\n", yytext);}
%%

int main() {
    yyin = fopen("test_input.txt", "r");

    if (!yyin) {
        perror("Error: ");
        return EXIT_FAILURE;
    }
    yylex();
    return EXIT_SUCCESS;
}
