
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